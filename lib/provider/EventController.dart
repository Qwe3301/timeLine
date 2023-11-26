import 'package:flutter/material.dart';
import 'package:time_line/data/dataFake/DataFake.dart';

class EventController extends ChangeNotifier {
  DataFake db = DataFake();

  List<Map<String, dynamic>> get dbClone => db.teste2;
  List<Map<String, int>> listaOpen = [];

  void addListaOpen(int firstYearParam, int lastParam, int colorParam) {
    listaOpen
        .add({"inicio": firstYearParam, "end": lastParam, "color": colorParam});
    notifyListeners();
  }

  void removeArrayIsOpen(int inicioParam) {
    listaOpen.removeWhere((element) => element["inicio"] == inicioParam);
    notifyListeners();
  }

  void changeIsOpen(int eachYear) {
    for (var i = 0; i < db.teste2.length; i++) {
      if (db.teste2[i]["inicio"] == eachYear) {
        if (db.teste2[i]["isOpen"]) {
          removeArrayIsOpen(dbClone[i]["inicio"]);
          notifyListeners();
        } else {
          addListaOpen(
              dbClone[i]["inicio"], dbClone[i]["final"], dbClone[i]["color"]);
          notifyListeners();
        }
        db.teste2[i]["isOpen"] = !db.teste2[i]["isOpen"];
      }
    }
  }

  bool linha(indexParam, eachYearParam) =>
      listaOpen.isNotEmpty &&
      listaOpen[indexParam]["inicio"]! <= eachYearParam &&
      listaOpen[indexParam]["end"]! >= eachYearParam;

  int colorLine(int eachYearParam) {
    int colorLineVar = 0;
    for (var i = 0; i < dbClone.length; i++) {
      if (eachYearParam == dbClone[i]["inicio"]) {
        colorLineVar = dbClone[i]["color"]!;
      }
    }
    return colorLineVar;
  }

  bool hasEvent(int eachYearParam) {
    bool? isOpenVar;
    for (var i = 0; i < db.teste2.length; i++) {
      if (db.teste2[i]["inicio"] == eachYearParam) {
        isOpenVar = true;
      }
    }
    return isOpenVar ?? false;
  }

  bool isOpen(int eachYearParam) {
    bool? isOpenVar;
    for (var i = 0; i < db.teste2.length; i++) {
      if (db.teste2[i]["inicio"] == eachYearParam && db.teste2[i]["isOpen"]) {
        isOpenVar = true;
      }
    }
    return isOpenVar ?? false;
  }

  String name(int eachYearParam) {
    String? isOpen;
    for (var i = 0; i < db.teste2.length; i++) {
      if (db.teste2[i]["inicio"] == eachYearParam) {
        isOpen = db.teste2[i]["nome"];
      }
    }
    return isOpen ?? "";
  }
}
