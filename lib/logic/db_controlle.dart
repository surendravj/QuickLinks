import 'package:quicklink/database.dart';
import 'package:quicklink/logic/link_controller.dart';

class DBController {
  Future<void> addToDatabase(String title, String category, String url) async {
    await DBservice.init();
    await DBservice.db
        .insert('links', {'title': title, 'category': category, 'url': url});
  }

  Future<List<Link>> getDataFomDB() async {
    await DBservice.init();
    var results = await DBservice.db.query('links');
    return results
        .map(
          (e) => Link(e['id'], e['title'], e['category'], e['url'], e['count']),
        )
        .toList();
  }

  Future<void> deleteById(int id) async {
    await DBservice.init();
    await DBservice.db.rawDelete('DELETE FROM links WHERE id=?', [id]);
  }

  Future<void> updateCountInDB(int id, int count) async {
    await DBservice.init();
    await DBservice.db
        .rawUpdate('UPDATE links set count=? WHERE id=?', [count, id]);
  }
}
