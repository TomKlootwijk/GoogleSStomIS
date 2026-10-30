#!/usr/bin/env python3
"""Explicit-namespace inventory; optional exact-file download. Never executes repo code."""
from __future__ import annotations
import argparse
import hashlib
import json
import os
import pathlib
import re
import sys
from datetime import datetime, timezone

NAMESPACE = re.compile(r"^[A-Za-z0-9][A-Za-z0-9_.-]{0,95}$")
REVISION = re.compile(r"^[0-9a-fA-F]{40}$")

def checked_namespace(value):
    if not NAMESPACE.fullmatch(value):
        raise ValueError("Use the exact Hugging Face username or organization, not a URL")
    return value

def item_dict(info, kind):
    card = getattr(info, "card_data", None) or getattr(info, "cardData", None)
    if hasattr(card, "to_dict"):
        card = card.to_dict()
    card = card if isinstance(card, dict) else {}
    files = [getattr(x, "rfilename", "") for x in (getattr(info, "siblings", None) or [])]
    gguf = [name for name in files if name.lower().endswith(".gguf")]
    safetensors = any(name.lower().endswith(".safetensors") for name in files)
    return {
        "repo_id": info.id,
        "repo_type": kind,
        "revision": getattr(info, "sha", None),
        "private": bool(getattr(info, "private", False)),
        "gated": getattr(info, "gated", False),
        "license": card.get("license"),
        "pipeline_tag": getattr(info, "pipeline_tag", None),
        "library_name": getattr(info, "library_name", None),
        "files": files,
        "gguf_candidates": gguf,
        "routing": "dataset-retrieval-or-training-input" if kind == "dataset" else (
            "gguf-needs-architecture-memory-and-license-check" if gguf else (
                "safetensors-needs-runtime-or-conversion" if safetensors else "manual-compatibility-review")),
        "activation": "not_loaded",
        "dataset_semantics": "Data is not executable instructions" if kind == "dataset" else None,
    }

def api_client():
    try:
        from huggingface_hub import HfApi
    except ImportError as e:
        raise RuntimeError("Install requirements-tools.txt in a Python environment first") from e
    # Use only an explicitly provided environment token; do not implicitly probe
    # unrelated cached account sessions. Never write this value into output.
    return HfApi(token=os.environ.get("HF_TOKEN") or False)

def inventory(namespaces, maximum):
    api = api_client()
    entries = []
    complete = True
    for ns in namespaces:
        checked_namespace(ns)
        for kind in ("model", "dataset"):
            stream = api.list_models(author=ns, full=True, cardData=True) if kind == "model" else api.list_datasets(author=ns, full=True)
            for info in stream:
                if len(entries) >= maximum:
                    complete = False
                    break
                entry = item_dict(info, kind)
                if not entry["repo_id"].startswith(ns + "/"):
                    raise RuntimeError("Hub returned a repository outside the requested namespace")
                entries.append(entry)
    return {
        "schema_version": 1,
        "retrieved_at_utc": datetime.now(timezone.utc).isoformat(),
        "requested_namespaces": namespaces,
        "scope": "Repositories visible to supplied token, or public repositories without a token",
        "inventory_complete_within_visible_scope": complete,
        "entries": entries,
        "weights_downloaded": False,
        "models_loaded": False,
    }

def stage(args):
    if not re.fullmatch(r"[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+", args.repo):
        raise ValueError("Repository must be namespace/name")
    checked_namespace(args.repo.split("/")[0])
    if not REVISION.fullmatch(args.revision):
        raise ValueError("Pin a complete 40-character commit revision from the catalog")
    name = pathlib.PurePosixPath(args.filename)
    if name.is_absolute() or ".." in name.parts or "\\" in args.filename:
        raise ValueError("Invalid repository-relative filename")
    allowed = {".gguf", ".safetensors", ".json", ".jsonl", ".csv", ".parquet", ".txt", ".md"}
    if name.suffix.lower() not in allowed:
        raise ValueError("This staging tool only downloads explicitly supported data formats")
    if not 1 <= args.budget_mib <= 65536:
        raise ValueError("Budget must be 1..65536 MiB")
    api = api_client()
    info = api.repo_info(args.repo, repo_type=args.repo_type, revision=args.revision, files_metadata=True)
    candidate = next((x for x in (info.siblings or []) if x.rfilename == args.filename), None)
    size = getattr(candidate, "size", None)
    if size is None or size > args.budget_mib * 1024 * 1024:
        raise RuntimeError("Exact size unknown or exceeds the explicit transfer budget")
    if getattr(info, "sha", "").lower() != args.revision.lower():
        raise RuntimeError("Resolved revision does not match requested commit")
    destination = pathlib.Path(args.destination).resolve()
    destination.mkdir(parents=True, exist_ok=True)
    # One repository revision per staging directory avoids accidental overwrite
    # when two models both use a filename such as model.gguf.
    owner, repository = args.repo.split("/")
    local_dir = destination / owner / repository / args.revision
    from huggingface_hub import hf_hub_download
    path = pathlib.Path(hf_hub_download(
        repo_id=args.repo, repo_type=args.repo_type, revision=args.revision,
        filename=args.filename, local_dir=local_dir,
        token=os.environ.get("HF_TOKEN") or False,
    ))
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    if path.stat().st_size != size:
        raise RuntimeError("Downloaded file size does not match metadata")
    lfs = getattr(candidate, "lfs", None)
    expected = getattr(lfs, "sha256", None) or (lfs.get("sha256") if isinstance(lfs, dict) else None)
    if expected and digest.hexdigest() != expected:
        path.unlink()
        raise RuntimeError("Downloaded file failed SHA-256 validation")
    result = {"repo_id": args.repo, "repo_type": args.repo_type, "revision": args.revision,
              "filename": args.filename, "bytes": size, "sha256": digest.hexdigest(),
              "server_sha256_verified": bool(expected), "path": str(path), "executed": False}
    receipt_dir = destination / ".receipts" / owner / repository / args.revision
    receipt_dir.mkdir(parents=True, exist_ok=True)
    receipt_id = hashlib.sha256(args.filename.encode("utf-8")).hexdigest()
    (receipt_dir / (receipt_id + ".json")).write_text(json.dumps(result, indent=2) + "\n")
    return result

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)
    catalog = sub.add_parser("catalog")
    catalog.add_argument("--namespace", action="append", required=True)
    catalog.add_argument("--out", required=True)
    catalog.add_argument("--max-repos", type=int, default=10000)
    download = sub.add_parser("stage")
    download.add_argument("--repo", required=True)
    download.add_argument("--repo-type", choices=["model", "dataset"], default="model")
    download.add_argument("--revision", required=True)
    download.add_argument("--filename", required=True)
    download.add_argument("--destination", required=True)
    download.add_argument("--budget-mib", type=int, default=4096)
    args = parser.parse_args()
    try:
        if args.command == "catalog":
            if not 1 <= args.max_repos <= 100000:
                raise ValueError("max-repos must be 1..100000")
            result = inventory(args.namespace, args.max_repos)
            path = pathlib.Path(args.out)
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(json.dumps(result, indent=2, ensure_ascii=False) + "\n")
            print(json.dumps({"catalog": str(path), "entries": len(result["entries"]),
                              "complete": result["inventory_complete_within_visible_scope"]}))
        else:
            print(json.dumps(stage(args), indent=2))
    except Exception as error:
        # Avoid printing HTTP request headers or tokens in tracebacks.
        print(f"{type(error).__name__}: operation failed. Check access, exact identifiers, quotas, and pinned revisions.", file=sys.stderr)
        return 1
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
