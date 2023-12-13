import 'package:time_line/data/models/event_model.dart';

abstract class CRUDevent {
  void addEvent();
  List<EventModel> read();
  void update();
  void delete();
}
