import 'package:flutter/material.dart';

class TimeLineModel {
  TimeLineModel(
      {required this.title,
      required this.event,
      this.image,
      required this.content,
      required this.nascimento,
      this.morte});
  String title;
  String event;
  String content;
  AssetImage? image;
  int? nascimento;
  int? morte;
}
