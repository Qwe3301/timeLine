import 'package:flutter/material.dart';
import 'package:time_line/data/data_fake/data_fake.dart';
import 'package:time_line/data/models/Crude_event.dart';

class RepositoryController extends ChangeNotifier implements CRUDevent {
  DataFake db = DataFake();

  List<Map<String, dynamic>> get eventsClone => db.teste2;

  @override
  List<Map<String, dynamic>> read() {
    return eventsClone;
  }

  @override
  void createEvent() {
    // TODO: implement createEvent
  }

  @override
  void delete() {
    // TODO: implement delete
  }

  @override
  void update() {
    // TODO: implement update
  }
}
