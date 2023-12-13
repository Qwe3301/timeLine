import 'package:flutter/material.dart';
import 'package:time_line/data/data_fake/data_fake.dart';
import 'package:time_line/data/models/Crude_event.dart';
import 'package:time_line/data/models/event_model.dart';

class RepositoryController extends ChangeNotifier implements CRUDevent {
  List<Map<String, dynamic>> eventsClone = DataFake().teste2;

  List<EventModel> events = [];

  List<EventModel> converteToEventModel() {
    for (Map<String, dynamic> event in eventsClone) {
      events.add(
        EventModel(
          name: event["nome"],
          imageUrl: event["image"],
          content: event["content"],
          startDate: event["inicio"],
          endDate: event["final"],
          isOpen: event["isOpen"],
          color: event["color"],
        ),
      );
    }
    notifyListeners();
    return events;
  }

  @override
  List<EventModel> read() {
    debugPrint("Leu esta Lista ${events.length}");
    return events;
  }

  int eventsLength() {
    print("Este e o evento: ${events.length}");
    return events.length;
  }

  EventModel eventByIndex(index) => events[index];

  @override
  void addEvent({name, imageUrl, content, startDate, endDate, isOpen, color}) {
    events.add(
      EventModel(
        name: name,
        imageUrl: imageUrl,
        content: content,
        startDate: startDate,
        endDate: endDate,
        isOpen: isOpen,
        color: color,
      ),
    );
    notifyListeners();
  }

  @override
  void delete() {
    // TODO: implement delete
  }

  @override
  void update() {
    // TODO: implement update
  }

  var listaAleatoria = [];
  Iterable<EventModel> teste(int eachYearParam) {
    var teste = events.where((e) {
      return e.startDate == eachYearParam;
    });

    print(teste);
    return teste;
  }
}
