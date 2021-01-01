import 'package:flutter/cupertino.dart';
import 'package:quicklink/logic/db_controlle.dart';

class Link {
  final int id;
  final String title;
  final String category;
  final String url;
  int count;
  Link(this.id, this.title, this.category, this.url, this.count);
}

class Links extends ChangeNotifier {
  List<Link> links = [];
  bool isLoading = true;

  getData() async {
    links = await DBController().getDataFomDB();
    isLoading = false;
    notifyListeners();
  }

  addLink(String title, String category, String url) async {
    links.add(Link((links.length + 1), title, category, url, 0));
    await DBController().addToDatabase(title, category, url);
    notifyListeners();
  }

  removeLink(int id) async {
    links.removeWhere((element) => element.id == id);
    await DBController().deleteById(id);
    notifyListeners();
  }

  updateLink(int id) async {
    var index = links.indexWhere((element) => element.id == id);
    await DBController().updateCountInDB(id, links[index].count);
    links[index].count++;
    notifyListeners();
  }
}
