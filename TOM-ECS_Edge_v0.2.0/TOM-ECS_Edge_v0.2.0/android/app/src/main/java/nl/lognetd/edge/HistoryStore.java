package nl.lognetd.edge;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/** A finite app-private archive, not an infinite model context or vector index. */
final class HistoryStore extends SQLiteOpenHelper {
    private static final int MAX_ROWS = 10000;
    private static final int MAX_TEXT_BYTES = 2 * 1024 * 1024;
    HistoryStore(Context context) { super(context, "local_history.db", null, 1); }
    @Override public void onCreate(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE events (id INTEGER PRIMARY KEY AUTOINCREMENT, "
                + "created_utc TEXT NOT NULL, source TEXT NOT NULL, text TEXT NOT NULL, "
                + "text_bytes INTEGER NOT NULL, private_data INTEGER NOT NULL)");
    }
    @Override public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        throw new IllegalStateException("No schema migration is defined for this prototype");
    }
    synchronized void append(String source, String text, boolean privateData) {
        SQLiteDatabase db = getWritableDatabase();
        db.beginTransaction();
        try {
            insert(db, source, text, privateData);
            enforceLimits(db);
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
    }
    private static void insert(SQLiteDatabase db, String source, String text, boolean privateData) {
        String bounded = text.length() > 4000 ? text.substring(0,4000) : text;
        while (bounded.getBytes(StandardCharsets.UTF_8).length > 4096)
            bounded = bounded.substring(0, bounded.length() - 1);
        ContentValues values = new ContentValues();
        values.put("created_utc", Instant.now().toString());
        values.put("source", source.length() > 256 ? source.substring(0,256) : source);
        values.put("text", bounded);
        values.put("text_bytes", bounded.getBytes(StandardCharsets.UTF_8).length);
        values.put("private_data", privateData ? 1 : 0);
        db.insertOrThrow("events", null, values);
    }
    private static void enforceLimits(SQLiteDatabase db) {
        db.execSQL("DELETE FROM events WHERE id IN (SELECT id FROM events ORDER BY id DESC LIMIT -1 OFFSET " + MAX_ROWS + ")");
        while (DatabaseUtils.longForQuery(db, "SELECT COALESCE(SUM(text_bytes),0) FROM events", null) > MAX_TEXT_BYTES) {
            db.execSQL("DELETE FROM events WHERE id IN (SELECT id FROM events ORDER BY id LIMIT 128)");
        }
    }
    synchronized void seedDocuments(InputStream stream) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int count;
        while ((count = stream.read(buffer)) != -1) {
            if (bytes.size() + count > 1024 * 1024) throw new IllegalArgumentException("source cards exceed 1 MiB");
            bytes.write(buffer,0,count);
        }
        JSONArray cards = new JSONObject(bytes.toString(StandardCharsets.UTF_8.name())).getJSONArray("cards");
        SQLiteDatabase db = getWritableDatabase();
        db.beginTransaction();
        try {
            db.delete("events", "source LIKE ?", new String[]{"document:%"});
            for (int i=0; i<cards.length(); i++) {
                JSONObject card = cards.getJSONObject(i);
                insert(db, "document:" + card.getString("source_id") + ":" + card.getString("id")
                        + " pages " + card.getJSONArray("pages"),
                        "[" + card.getString("status") + "] " + card.getString("title")
                        + ": " + card.getString("text"), true);
            }
            enforceLimits(db);
            db.setTransactionSuccessful();
        } finally { db.endTransaction(); }
    }
    synchronized String referenceContext(String query) {
        return referenceContext(query, false);
    }
    synchronized String documentReferenceContext(String query) {
        return referenceContext(query, true);
    }
    private String referenceContext(String query, boolean documentsOnly) {
        List<String> words = new ArrayList<>();
        for (String word : query.toLowerCase(Locale.ROOT).split("[^\\p{L}\\p{N}_]+")) {
            if (word.length() < 4 || java.util.Arrays.asList("what","when","where","which","have","with","this","that","from","about").contains(word)) continue;
            words.add("%" + word + "%");
            if (words.size() == 8) break;
        }
        String where = words.isEmpty() ? null : String.join(" OR ", java.util.Collections.nCopies(words.size(), "LOWER(text) LIKE ?"));
        if (documentsOnly) {
            if (words.isEmpty()) return "Use at least one specific keyword of four or more characters.";
            where = "source LIKE 'document:%' AND (" + where + ")";
        }
        StringBuilder context = new StringBuilder();
        try (Cursor rows = getReadableDatabase().query("events",
                new String[]{"source", "text", "created_utc"}, where,
                words.isEmpty() ? null : words.toArray(new String[0]), null, null,
                "CASE WHEN source LIKE 'document:%' THEN 0 ELSE 1 END, id DESC", "4")) {
            while (rows.moveToNext() && context.length() < 3500) {
                String fact = rows.getString(1);
                if (fact.length() > 1000) fact = fact.substring(0,1000);
                String entry = "Source: " + rows.getString(0) + "\nRecorded UTC: " + rows.getString(2)
                        + "\n" + fact + "\n\n";
                if (context.length() + entry.length() > 3500) break;
                context.append(entry);
            }
        }
        return context.toString();
    }
    synchronized void clearMeasurements() {
        getWritableDatabase().delete("events", "source NOT LIKE ?", new String[]{"document:%"});
    }
}
