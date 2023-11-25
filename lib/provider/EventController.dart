import 'package:flutter/material.dart';
import 'package:time_line/data/dataFake/DataFake.dart';

class EventController extends ChangeNotifier {
  DataFake db = DataFake();

  Map<int, Map<String, dynamic>> get dbClone => db.teste2;
  List<Map<String, int>> listaOpen = [];

  void addListaOpen(int inicio, int end, int color) {
    listaOpen.add(
      {"inicio": inicio, "end": end, "color": color},
    );

    notifyListeners();
  }

  void removeArrayIsOpen(int inicio) {
    listaOpen.removeWhere((element) => element["inicio"] == inicio);
    notifyListeners();
  }

  bool linha(i, year, index) {
    bool a = false;
    if (listaOpen.isNotEmpty &&
        listaOpen[i]["inicio"]! <= year + index &&
        listaOpen[i]["end"]! >= year + index) {
      return a = true;
    }
    return a;
  }

  void functionChangeIsOpen(int year) {
    if (dbClone[year]!["isOpen"]) {
      removeArrayIsOpen(dbClone[year]!["inicio"]);
      notifyListeners();
    } else {
      addListaOpen(dbClone[year]!["inicio"], dbClone[year]!["final"],
          dbClone[year]!["color"]);
      notifyListeners();
    }
    dbClone[year]!["isOpen"] = !dbClone[year]!["isOpen"];
  }
}
