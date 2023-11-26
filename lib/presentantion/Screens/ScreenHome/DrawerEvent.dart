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
      color: Colors.green,
      child: ListView.builder(
        itemCount: timeLineController.dbClone.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () => {},
            child: Text(timeLineController.db.teste2[index]["nome"]),
          );
        },
      ),
    );
  }
}