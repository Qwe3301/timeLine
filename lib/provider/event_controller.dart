import 'package:flutter/material.dart';
import 'package:time_line/provider/repository_controller.dart';

class EventController extends ChangeNotifier {
  List<Map<String, dynamic>> eventsClone = RepositoryController().eventsClone;
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

  void changeIsOpen(int eachYearParam) {
    for (var i = 0; i < eventsClone.length; i++) {
      if (eventsClone[i]["inicio"] == eachYearParam) {
        if (eventsClone[i]["isOpen"]) {
          removeArrayIsOpen(eventsClone[i]["inicio"]);
          notifyListeners();
        } else {
          addListaOpen(eventsClone[i]["inicio"], eventsClone[i]["final"],
              eventsClone[i]["color"]);
          notifyListeners();
        }
        eventsClone[i]["isOpen"] = !eventsClone[i]["isOpen"];
      }
    }
  }

  bool linha(indexParam, eachYearParam) =>
      listaOpen.isNotEmpty &&
      listaOpen[indexParam]["inicio"]! <= eachYearParam &&
      listaOpen[indexParam]["end"]! >= eachYearParam;

  int colorLine(int eachYearParam) {
    int colorLineVar = 0;
    for (var i = 0; i < eventsClone.length; i++) {
      if (eachYearParam == eventsClone[i]["inicio"]) {
        colorLineVar = eventsClone[i]["color"]!;
      }
    }
    return colorLineVar;
  }

  Iterable<Map<String, dynamic>> teste(int eachYearParam) =>
      eventsClone.where((e) => e['inicio'] == eachYearParam);
}
