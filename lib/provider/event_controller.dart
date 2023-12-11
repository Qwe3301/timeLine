import 'package:flutter/material.dart';
import 'package:time_line/data/models/event_model.dart';
import 'package:time_line/provider/repository_controller.dart';

class EventController extends ChangeNotifier {
  RepositoryController eventsClone = RepositoryController();
  List<EventModel> listaOpenOutra = [];

  void removeArrayIsOpen2(int inicioParam) {
    listaOpenOutra.removeWhere((element) => element.startDate == inicioParam);
    notifyListeners();
  }

  void changeIsOpen2(int eachYearParam) {
    print(eventsClone.eventsLength());
    for (var i = 0; i < eventsClone.eventsLength(); i++) {
      if (eventsClone.eventByIndex(i).startDate == eachYearParam) {
        if (eventsClone.eventByIndex(i).isOpen) {
          removeArrayIsOpen2(eventsClone.eventByIndex(i).startDate);
          notifyListeners();
          print("esta Colocanto ?");
        } else {
          print("esta Colocanto ?");
          listaOpenOutra.add(eventsClone.eventByIndex(i));
        }
        eventsClone.eventByIndex(i).isOpen =
            !eventsClone.eventByIndex(i).isOpen;
        notifyListeners();
      }
    }
  }

  bool linha(indexParam, eachYearParam) =>
      listaOpenOutra.isNotEmpty &&
      listaOpenOutra[indexParam].startDate <= eachYearParam &&
      listaOpenOutra[indexParam].endDate >= eachYearParam;

  int colorLine(int eachYearParam) {
    int colorLineVar = 0;
    for (var i = 0; i < eventsClone.eventsLength(); i++) {
      if (eachYearParam == eventsClone.eventByIndex(i).startDate) {
        colorLineVar = eventsClone.eventByIndex(i).endDate;
      }
    }
    return colorLineVar;
  }
}
