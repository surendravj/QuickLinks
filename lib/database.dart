import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBservice {
  static Database db;
  static int version = 1;

  static Future<void> init() async {
    if (db != null) {
      return;
    }
    try {
      var dbPath = await getDatabasesPath();
      var path = join(dbPath, 'Link.db');
      db = await openDatabase(path, version: version, onCreate: onCreate);
    } catch (e) {
      print(e);
    }
  }

  static void onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE links (id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, category STRING, url STRING, count INTEGER DEFAULT 0)',
    );
  }
}
