import 'package:time_line/data/models/event_model.dart';

abstract class CRUDevent {
  void createEvent();
  List<EventModel> read();
  void update();
  void delete();
}
