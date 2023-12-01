import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_line/provider/TimeLineController.dart';

class DrawerEvent extends StatefulWidget {
  const DrawerEvent({super.key});

  @override
  State<DrawerEvent> createState() => _DrawerEventState();
}

class _DrawerEventState extends State<DrawerEvent> {
  @override
  Widget build(BuildContext context) {
    var timeLineController = context.read<TimeLineController>();

    void functionFocusYear(int year) {
      timeLineController.functionZerarMoreYear();
      timeLineController.functionChangeFocusYear(year);
      timeLineController.functionScrollControllerJumpTo(0);
    }

    return Container(
      child: ListView.builder(
        itemCount: timeLineController.dbClone.length,
        itemExtent: 50,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color(timeLineController.db.teste2[index]["color"])),
              onPressed: () => {
                functionFocusYear(timeLineController.dbClone[index]["inicio"])
              },
              child: Text(
                timeLineController.db.teste2[index]["nome"],
                style: const TextStyle(color: Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
