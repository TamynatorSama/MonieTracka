import 'package:flutter/material.dart';

BottomNavigatorController navigatorController = BottomNavigatorController();

class BottomNavigatorController extends ChangeNotifier {
  int pageIndex = 0;

  changePage(int index) {
    pageIndex = index;
    notifyListeners();
  }
}

class PageInfo {
  final Widget widget;
  final String icon;
  final String label;
  const PageInfo(
      {required this.widget, required this.icon, required this.label});
}
