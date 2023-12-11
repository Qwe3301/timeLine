import 'package:flutter/material.dart';
import 'package:time_line/provider/repository_controller.dart';

class Search_Controller extends ChangeNotifier {
  RepositoryController events = RepositoryController();

  bool isSearching = false;
  String textSearch = "";

  FocusNode isSearchingFocus = FocusNode();

  void addSearchListener() {
    isSearchingFocus.addListener(() {
      if (isSearchingFocus.hasFocus) {
        changeIsSearching(true);
      } else {
        changeIsSearching(false);
      }
    });
  }

  void changeIsSearching(bool isSearchingParan) {
    isSearching = isSearchingParan;
    notifyListeners();
  }

  void changeTextSearch(String text) {
    textSearch = text;
    notifyListeners();
  }

  List functionFilter(text) {
    List listFilter = [];
    for (var event in events.events) {
      if (event.name.toLowerCase().contains(text.toLowerCase()) ||
          event.startDate.toString().contains(text)) {
        listFilter.add(event);
      }
    }
    return listFilter;
  }
}
