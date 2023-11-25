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
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => functionFocusYear(-1360),
            child: Text("Roberto Carlos Pereira da Silva"),
          ),
          ElevatedButton(
            onPressed: () => functionFocusYear(1708),
            child: Text("Sofia Gomes"),
          ),
          ElevatedButton(
            onPressed: () => functionFocusYear(1709),
            child: Text("Ribeirao de Carvalho Paula"),
          ),
          ElevatedButton(
            onPressed: () => functionFocusYear(1712),
            child: Text("Gustavo Winchester"),
          ),
          ElevatedButton(
            onPressed: () => functionFocusYear(1716),
            child: Text("Carlos"),
          ),
          ElevatedButton(
            onPressed: () => functionFocusYear(1717),
            child: Text("Jacson Carlo Amaral"),
          ),
          ElevatedButton(
            onPressed: () => functionFocusYear(3720),
            child: Text("Gustavo Winchester"),
          ),
          ElevatedButton(
            onPressed: () => functionFocusYear(69696969696969696),
            child: Text("hehe Safado"),
          ),
        ],
      ),
    );
  }
}
