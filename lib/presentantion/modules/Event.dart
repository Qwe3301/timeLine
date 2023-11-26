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
    int eachYear = widget.year + widget.index;

    return Container(
      color: Colors.white,
      height: db.isOpen(eachYear) ? 300 : 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Text("$eachYear"),
          ),
          Stack(
            children: [
              for (int index = 0; index < db.listaOpen.length; index++)
                if (db.linha(index, eachYear))
                  Container(
                    margin: EdgeInsets.only(left: 10.0 * index),
                    width: 3,
                    height: db.isOpen(eachYear) ? 300 : 50,
                    color: Color(db.listaOpen[index]["color"] ?? 0xff0000),
                  ),
            ],
          ),
          if (db.hasEvent(eachYear))
            Flexible(
              child: GestureDetector(
                onTap: () => db.changeIsOpen(eachYear),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: db.isOpen(eachYear) ? 295 : 40,
                      decoration: BoxDecoration(
                        color: Color(db.colorLine(eachYear)),
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                          child: Text(
                        " ${db.name(eachYear)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
