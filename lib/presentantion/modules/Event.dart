import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_line/provider/EventController.dart';

class EventModule extends StatefulWidget {
  EventModule({super.key, required this.year, required this.index});
  int year;
  int index;

  @override
  State<EventModule> createState() => _EventModuleState();
}

class _EventModuleState extends State<EventModule> {
  @override
  Widget build(BuildContext context) {
    EventController db = Provider.of<EventController>(context);
    Map<String, dynamic>? dbEvent = db.dbClone[widget.year + widget.index];
    bool dbNotNull = dbEvent != null;

    Stack functionLine() {
      Stack line = const Stack();
      line = Stack(
        children: [
          for (int i = 0; i < db.listaOpen.length; i++)
            if (db.linha(i, widget.year, widget.index))
              Container(
                margin: EdgeInsets.only(left: 10.0 * i),
                width: 3,
                height: dbNotNull && dbEvent["isOpen"] ? 300 : 50,
                color: Color(db.listaOpen[i]["color"] ?? 0xff0000),
              ),
        ],
      );
      return line;
    }

    Flexible functionEvent() {
      return Flexible(
        child: GestureDetector(
          onTap: () => db.functionChangeIsOpen(widget.year + widget.index),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: dbEvent!["isOpen"] ? 295 : 40,
                decoration: BoxDecoration(
                  color: Color(dbEvent["color"]),
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                    child: Text(
                  " ${dbEvent["nome"]}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      color: Colors.white,
      height: dbNotNull && dbEvent["isOpen"] ? 300 : 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Text("${widget.year + widget.index}"),
          ),
          functionLine(),
          if (dbNotNull) functionEvent(),
        ],
      ),
    );
  }
}
