import 'package:flutter/material.dart';

class ViewProvider extends ChangeNotifier {
  bool _view = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  bool get view => _view;
  GlobalKey<ScaffoldState> get key => _key;
  void setView(bool newView) {
    _view = newView;
    notifyListeners();
  }

  void openDrawer() {
    _key.currentState!.openDrawer();
    notifyListeners();
  }
}
