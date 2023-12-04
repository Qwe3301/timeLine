import 'package:flutter/material.dart';
import 'package:time_line/provider/event_controller.dart';
import 'dart:ui';

class SearchModule extends StatefulWidget {
  SearchModule({super.key, required this.textSerch});
  String textSerch;
  @override
  State<SearchModule> createState() => _SearchModuleState();
}

class _SearchModuleState extends State<SearchModule> {
  @override
  Widget build(BuildContext context) {
    EventController db = EventController();

    List functionFilter(text) {
      List listFilter = [];
      for (var event in db.dbClone) {
        if (event["nome"].toLowerCase().contains(text.toLowerCase()) ||
            event["inicio"].toString().contains(text)) {
          listFilter.add(event);
        }
      }
      return listFilter;
    }

    List filter = functionFilter(widget.textSerch);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: ListView.builder(
            itemCount: filter.length,
            itemBuilder: ((context, index) {
              return Center(
                child: Container(
                  width: 300,
                  height: 40,
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      color: Color(filter[index]["color"]),
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                      "${filter[index]["inicio"]}- ${filter[index]["nome"]} "),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
