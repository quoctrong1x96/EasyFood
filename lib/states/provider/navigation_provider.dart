import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _index = 0;
  PageController _pageIndex = PageController(initialPage: 0);

  int get index => _index;
  PageController get pageIndex => _pageIndex;

  /// Mengganti index navigasi halaman utama
  void changeIndex(int index, {int initialPage = 0}) {
    _index = index;
    //if (_pageIndex.hasClients) {
    _pageIndex.jumpToPage(index);
    print("Page: " + _index.toString());
    //}

    _pageIndex = PageController(initialPage: index);

    notifyListeners();
  }
}
