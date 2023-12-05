import 'package:flutter/material.dart';
import 'package:time_line/data/data_fake/data_fake.dart';
import 'package:time_line/provider/repository_controller.dart';

class TimeLineController extends ChangeNotifier {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 40 * 50);

  ScrollController get scrollController => _scrollController;

  List<Map<String, dynamic>> dbClone = RepositoryController().eventsClone;

  void addNewScrollListener() {
    _scrollController.addListener(scrollListener);
  }

  int moreYear = 0;
  int focusYear = 1658;

  void scrollListener() {
    if (scrollController.offset < 40 * 5) {
      functionDecreaseYear(100);
      functionScrollControllerJumpTo(105);
      notifyListeners();
    }
    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      functionMoreYear(100);
      notifyListeners();
    }
  }

  void functionDecreaseYear(int decreaseParam) {
    focusYear = focusYear - decreaseParam;
    notifyListeners();
  }

  void functionScrollControllerJumpTo(double jumpToParam) {
    scrollController.jumpTo(40 * jumpToParam);
    notifyListeners();
  }

  void functionMoreYear(int moreYearParam) {
    moreYear = moreYear + moreYearParam;
    notifyListeners();
  }

  void functionZerarMoreYear() {
    moreYear = 0;
    notifyListeners();
  }

  void functionChangeFocusYear(int newFocus) {
    focusYear = newFocus - 5;
    notifyListeners();
  }
}
