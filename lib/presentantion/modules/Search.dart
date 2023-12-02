import 'package:flutter/material.dart';
import 'package:time_line/provider/EventController.dart';

class SearchModule extends StatefulWidget {
  const SearchModule({super.key});

  @override
  State<SearchModule> createState() => _SearchModuleState();
}

class _SearchModuleState extends State<SearchModule> {
  @override
  Widget build(BuildContext context) {
    EventController db = EventController();

    return Container(
      color: Colors.black.withOpacity(0.8),
      child: ListView.builder(
        itemCount: db.dbClone.length,
        itemBuilder: ((context, index) => Center(
              child: Container(
                width: 300,
                height: 40,
                margin: const EdgeInsets.only(bottom: 5),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Color(db.dbClone[index]["color"]),
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                    "${db.dbClone[index]["inicio"]}- ${db.dbClone[index]["nome"]}"),
              ),
            )),
      ),
    );
  }
}
