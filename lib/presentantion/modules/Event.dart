import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_line/data/models/event_model.dart';
import 'package:time_line/provider/event_controller.dart';
import 'package:time_line/provider/repository_controller.dart';

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
    EventController db = Provider.of(context);
    RepositoryController cuBorra = Provider.of(context);
    int eachYear = widget.year + widget.index;
    Iterable<EventModel> teste = cuBorra.teste(eachYear);
    bool hasEvent = teste.isNotEmpty;

    Column eventContet(int eachYear) => Column(
          children: [
            Text("${teste.first.startDate} - ${teste.first.startDate}"),
            if (teste.first.imageUrl != "")
              Image.network(
                teste.first.imageUrl,
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
            Text(teste.first.content),
          ],
        );

    return Container(
      color: Colors.white,
      height: hasEvent && teste.first.isOpen ? 300 : 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Text("$eachYear"),
          ),
          Stack(
            children: [
              for (int index = 0; index < db.listaOpenOutra.length; index++)
                if (db.linha(index, eachYear))
                  Container(
                    margin: EdgeInsets.only(left: 10.0 * index),
                    width: 3,
                    height: hasEvent && teste.first.isOpen ? 300 : 40,
                    color: Color(db.listaOpenOutra[index].color),
                  ),
            ],
          ),
          if (hasEvent)
            Flexible(
              child: GestureDetector(
                onTap: () {
                  db.changeIsOpen2(eachYear);
                },
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: teste.first.isOpen ? 295 : 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(teste.first.color),
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " ${teste.first.name}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          if (teste.first.isOpen) eventContet(eachYear)
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
