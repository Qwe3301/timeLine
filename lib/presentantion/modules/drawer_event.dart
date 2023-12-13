import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_line/provider/repository_controller.dart';
import 'package:time_line/provider/time_line_controller.dart';

class DrawerEvent extends StatefulWidget {
  const DrawerEvent({super.key});

  @override
  State<DrawerEvent> createState() => _DrawerEventState();
}

class _DrawerEventState extends State<DrawerEvent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 700,
      child: Column(
        children: [
          Text("DAS"),
          Flexible(
            child: SizedBox(
              child: Consumer<RepositoryController>(
                builder: (context, value, child) => ListView.builder(
                  itemCount: value.eventsLength(),
                  itemBuilder: (context, index) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(
                        value.eventByIndex(index).color,
                      ),
                    ),
                    onPressed: () {
                      Provider.of<TimeLineController>(context, listen: false)
                          .functionFocusYear(
                              value.eventByIndex(index).startDate);
                    },
                    child: Text(
                      value.eventByIndex(index).name,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
