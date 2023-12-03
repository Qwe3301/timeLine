import 'package:flutter/material.dart';
import 'package:time_line/data/data_fake/data_fake.dart';

class RepositoryController extends ChangeNotifier {
  DataFake db = DataFake();

  void addDb({required int index, required String context, required int end}) {
    db.teste2.add({
      "nome": context,
      "context": "LETS GO",
      "inicio": index,
      "final": end,
      "isOpen": false,
      "color": 0xff000000,
    });
    notifyListeners();
  }
}