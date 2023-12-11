import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_line/provider/event_controller.dart';
import 'package:time_line/provider/repository_controller.dart';
import 'package:time_line/provider/search_controller.dart';
import 'dart:ui';

import 'package:time_line/provider/time_line_controller.dart';

class SearchModule extends StatefulWidget {
  SearchModule({super.key, required this.textSerch});
  String textSerch;
  @override
  State<SearchModule> createState() => _SearchModuleState();
}

class _SearchModuleState extends State<SearchModule> {
  @override
  Widget build(BuildContext context) {
    List filter = Provider.of<Search_Controller>(context, listen: false)
        .functionFilter(widget.textSerch);
    TimeLineController timeLineController = TimeLineController();
    void functionFocusYear(int year) {
      timeLineController.functionZerarMoreYear();
      timeLineController.functionChangeFocusYear(year);
      timeLineController.functionScrollControllerJumpTo(0);
    }

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: ListView.builder(
            itemCount: filter.length,
            itemBuilder: ((context, index) {
              return Center(
                child: GestureDetector(
                  onTap: () => functionFocusYear(1500),
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
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
