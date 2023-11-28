import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_line/provider/EventController.dart';

// ignore: must_be_immutable
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
    Iterable<Map<String, dynamic>> teste = db.teste(eachYear);
    bool hasEvent = teste.isNotEmpty;

    Column eventContet(int eachYear) => Column(
          children: [
            Text("${teste.first["inicio"]} - ${teste.first["inicio"]}"),
            if (teste.first["image"] != "")
              Image.network(
                teste.first["image"],
                height: 150,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  return child;
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            Text(teste.first["content"]),
          ],
        );

    return Container(
      color: Colors.white,
      height: hasEvent && teste.first["isOpen"] ? 300 : 40,
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
                    height: hasEvent && teste.first["isOpen"] ? 300 : 40,
                    color: Color(db.listaOpen[index]["color"] ?? 0xff0000),
                  ),
            ],
          ),
          if (hasEvent)
            Flexible(
              child: GestureDetector(
                onTap: () => db.changeIsOpen(eachYear),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: teste.first["isOpen"] ? 295 : 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(teste.first["color"]),
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " ${teste.first["nome"]}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          if (teste.first["isOpen"]) eventContet(eachYear)
                        ],
                      ),
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
