import 'package:flutter/material.dart';

class Search_Controller extends ChangeNotifier {
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
}
