#include "edge_ai/core.hpp"

#include <algorithm>
#include <array>
#include <cctype>
#include <cmath>
#include <iomanip>
#include <limits>
#include <set>
#include <sstream>
#include <stdexcept>
#include <tuple>

namespace edge_ai {
const char* route_name(Route route) {
  switch (route) {
    case Route::OfflineLookup: return "offline_lookup";
    case Route::LocalModel: return "local_model";
    case Route::RemoteTool: return "remote_tool";
    case Route::Defer: return "defer";
  }
  return "invalid";
}
Runtime::Runtime(Limits limits)
    : limits_(limits), scorer_({1.0, 0.25, -0.15, -0.2, -0.2}, 0.0) {
  if (limits_.cache_entries > 4096 || limits_.max_model_bytes == 0 ||
      limits_.cache_ttl_ms > 24ULL * 60 * 60 * 1000)
    throw std::invalid_argument("Runtime limits outside prototype bounds");
}
void Runtime::clear_cache() { cache_.clear(); lru_.clear(); }
bool Runtime::allowed(Route route, const Request& r, const Conditions& c) const {
  switch (route) {
    case Route::OfflineLookup:
      return !r.requires_model && !r.requires_fresh_data;
    case Route::LocalModel:
      return r.requires_model && !r.requires_fresh_data && c.model_available &&
             !r.model_revision.empty() && !c.thermal_severe &&
             r.estimated_model_bytes > 0 &&
             r.estimated_model_bytes <= limits_.max_model_bytes &&
             r.estimated_model_bytes <= c.available_memory_bytes;
    case Route::RemoteTool:
      return (r.requires_model || r.requires_fresh_data) && c.internet &&
             c.allow_remote && (!c.metered || c.allow_metered) &&
             (!r.contains_private_data || c.allow_private_remote) &&
             !c.thermal_severe;
    case Route::Defer: return false;
  }
  return false;
}
std::string Runtime::key(const Request& r, const Conditions& c) const {
  // Length-prefixed fields prevent concatenation collisions. Include every
  // semantic request/permission/backend/budget input; clock is checked by TTL.
  std::ostringstream out;
  out << r.requires_model << r.requires_fresh_data << r.contains_private_data << '|'
      << r.estimated_model_bytes << '|' << r.policy_revision << '|'
      << r.source_revision.size() << ':' << r.source_revision << '|'
      << r.model_revision.size() << ':' << r.model_revision << '|'
      << std::hexfloat << r.expected_gain << '|' << r.uncertainty << '|'
      << c.available_memory_bytes << '|' << c.model_available << c.internet
      << c.metered << c.allow_metered << c.allow_remote << c.allow_private_remote
      << c.thermal_severe << '|' << c.backend_revision;
  return out.str();
}
Decision Runtime::choose(const Request& r, const Conditions& c) {
  if (c.monotonic_ms < last_time_)
    throw std::invalid_argument("Monotonic clock regressed; create a new runtime session");
  if (r.source_revision.empty() || r.source_revision.size() > 256 ||
      r.model_revision.size() > 256 || !std::isfinite(r.expected_gain) ||
      r.expected_gain < 0 || r.expected_gain > 1 ||
      !std::isfinite(r.uncertainty) || r.uncertainty < 0 || r.uncertainty > 1)
    throw std::invalid_argument("Invalid request revisions or normalized utility inputs");
  last_time_ = c.monotonic_ms;
  const auto cache_key = key(r,c);
  auto cached = cache_.find(cache_key);
  if (cached != cache_.end()) {
    // A cached dispatch is never authority. Recheck guards before returning it.
    if (c.monotonic_ms - cached->second.created_ms <= limits_.cache_ttl_ms &&
        allowed(cached->second.decision.route, r, c)) {
      lru_.splice(lru_.begin(), lru_, cached->second.lru);
      auto result = cached->second.decision;
      result.cache_hit = true;
      return result;
    }
    lru_.erase(cached->second.lru);
    cache_.erase(cached);
  }
  Decision best;
  best.utility = -std::numeric_limits<double>::infinity();
  for (const auto route : {Route::OfflineLookup, Route::LocalModel, Route::RemoteTool}) {
    if (!allowed(route,r,c)) continue;
    const double latency = route == Route::OfflineLookup ? 0.02 :
                           route == Route::LocalModel ? 0.5 : 1.0;
    const double memory = route == Route::LocalModel ?
          static_cast<double>(r.estimated_model_bytes) / limits_.max_model_bytes : 0.0;
    const double network = route == Route::RemoteTool ? (c.metered ? 1.0 : 0.25) : 0.0;
    const std::array<double,5> features = {
        r.expected_gain, 1.0-r.uncertainty, latency, memory, network};
    const double utility = scorer_.evaluate(features);
    if (utility > best.utility) {
      best.route = route;
      best.utility = utility;
      best.reason = "Eligible route with highest fixed prototype utility";
    }
  }
  if (best.route == Route::Defer) {
    best.utility = 0.0;
    best.reason = "No eligible backend satisfies requirements, permissions, memory and thermal gates";
    return best;
  }
  if (limits_.cache_entries) {
    while (cache_.size() >= limits_.cache_entries) {
      cache_.erase(lru_.back());
      lru_.pop_back();
      ++evictions_;
    }
    lru_.push_front(cache_key);
    cache_.emplace(cache_key, Cached{best,c.monotonic_ms,lru_.begin()});
  }
  return best;
}

ReplayMemory::ReplayMemory(std::size_t max_events, std::size_t max_text_bytes)
    : max_events_(max_events), max_bytes_(max_text_bytes) {
  if (max_events_ == 0 || max_events_ > 100000 || max_bytes_ == 0 ||
      max_bytes_ > 256ULL * 1024 * 1024)
    throw std::invalid_argument("Replay limits outside prototype bounds");
}
void ReplayMemory::append(Event event) {
  if (event.source.empty() || event.source.size() > 256 || event.text.empty() ||
      event.text.size() > max_bytes_)
    throw std::invalid_argument("Event source/text missing or exceeds memory bound");
  if (has_event_ && (event.sequence <= last_sequence_ || event.monotonic_ms < last_time_))
    throw std::invalid_argument("Duplicate/out-of-order event or monotonic clock regression");
  last_sequence_ = event.sequence;
  last_time_ = event.monotonic_ms;
  has_event_ = true;
  while (!events_.empty() && (events_.size() >= max_events_ ||
                             event.text.size() > max_bytes_ - bytes_)) {
    bytes_ -= events_.front().text.size();
    events_.pop_front();
    ++evicted_;
  }
  bytes_ += event.text.size();
  events_.push_back(std::move(event));
}
ContextSelection ReplayMemory::select(const std::string& query,
      std::size_t budget, std::uint64_t now, std::uint64_t max_age,
      bool for_remote) const {
  if (query.size() > 4096 || (has_event_ && now < last_time_))
    throw std::invalid_argument("Query too large or monotonic clock regressed");
  budget = std::min(budget, max_bytes_);
  auto lower = [](std::string text) {
    for (auto& ch : text) ch = static_cast<char>(std::tolower(static_cast<unsigned char>(ch)));
    return text;
  };
  std::set<std::string> terms;
  std::istringstream words(lower(query));
  std::string word;
  while (words >> word) if (word.size() > 1) terms.insert(word);
  struct Ranked { const Event* event; std::size_t score; };
  std::vector<Ranked> ranked;
  for (const auto& event : events_) {
    if (now - event.monotonic_ms > max_age || (for_remote && event.private_data)) continue;
    const auto text = lower(event.text);
    std::size_t score = 0;
    for (const auto& term : terms) if (text.find(term) != std::string::npos) ++score;
    ranked.push_back({&event,score});
  }
  std::sort(ranked.begin(), ranked.end(), [](const Ranked& a, const Ranked& b) {
    return std::tie(a.score,a.event->sequence) > std::tie(b.score,b.event->sequence);
  });
  ContextSelection result;
  for (const auto& candidate : ranked) {
    const auto& event = *candidate.event;
    if (event.text.size() > budget - result.text_bytes) continue;
    result.events.push_back(event);
    result.text_bytes += event.text.size();
  }
  std::sort(result.events.begin(), result.events.end(), [](const Event& a, const Event& b) {
    return a.sequence < b.sequence;
  });
  result.omitted = events_.size() - result.events.size();
  return result;
}
}  // namespace edge_ai
