import 'package:flutter/material.dart';
import 'package:time_line/provider/EventController.dart';

class EventSearch extends SearchDelegate {
  EventController db = EventController();

  late List eventos = db.dbClone;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List teste = [];
    for (var evento in eventos) {
      if (evento["nome"].toLowerCase().contains(query.toLowerCase())) {
        teste.add(evento);
      }
    }
    return ListView.builder(
      itemCount: teste.length,
      itemBuilder: (context, index) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(teste[index]["color"])),
        onPressed: () => close(context, null),
        child: Text(teste[index]["nome"]),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List teste = [];
    for (var evento in eventos) {
      if (evento["nome"].toLowerCase().contains(query.toLowerCase())) {
        teste.add(evento);
      }
    }
    return ListView.builder(
      itemCount: teste.length,
      itemBuilder: (context, index) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(teste[index]["color"])),
        onPressed: () => close(context, null),
        child: Text(teste[index]["nome"]),
      ),
    );
  }
}
