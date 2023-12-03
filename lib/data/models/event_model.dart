class EventModel {
  EventModel({
    required this.name,
    required this.imageUrl,
    required this.content,
    required this.startDate,
    required this.endDate,
    required this.isOpen,
    required this.color,
  });
  String name;
  String imageUrl;
  String content;
  int startDate;
  int endDate;
  bool isOpen;
  int color;
}
