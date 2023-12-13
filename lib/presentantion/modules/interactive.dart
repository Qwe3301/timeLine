import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_line/presentantion/modules/event.dart';
import 'package:time_line/provider/time_line_controller.dart';

class InteractiveModule extends StatefulWidget {
  const InteractiveModule({super.key});
  @override
  State<InteractiveModule> createState() => _InteractiveModuleState();
}

class _InteractiveModuleState extends State<InteractiveModule> {
  @override
  Widget build(BuildContext context) {
    TimeLineController timeLineController =
        Provider.of<TimeLineController>(context);

    timeLineController.addNewScrollListener();

    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height - 84,
      width: size.width,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ListView.builder(
            controller: timeLineController.scrollController,
            itemCount: 300 + timeLineController.moreYear,
            itemBuilder: (BuildContext context, int index) {
              return EventModule(
                year: timeLineController.focusYear,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}
