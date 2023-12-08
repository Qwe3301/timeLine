import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_line/provider/time_line_controller.dart';

class DrawerEvent extends StatefulWidget {
  const DrawerEvent({super.key});

  @override
  State<DrawerEvent> createState() => _DrawerEventState();
}

class _DrawerEventState extends State<DrawerEvent> {
  @override
  Widget build(BuildContext context) {
    var timeLineController = context.read<TimeLineController>();
    Size size = MediaQuery.of(context).size;
    void functionFocusYear(int year) {
      timeLineController.functionZerarMoreYear();
      timeLineController.functionChangeFocusYear(year);
      timeLineController.functionScrollControllerJumpTo(0);
    }

    return SizedBox(
      width: 200,
      height: 700,
      child: Row(
        children: [
          ListView.builder(
            itemCount: timeLineController.dbClone.length,
            itemExtent: 50,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(timeLineController.dbClone[index]["color"])),
                  onPressed: () => {
                    functionFocusYear(
                        timeLineController.dbClone[index]["inicio"])
                  },
                  child: Text(
                    timeLineController.dbClone[index]["nome"],
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
