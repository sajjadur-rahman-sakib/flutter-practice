import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  var _count = 0;

  int get count => _count;

  void incrementCount() {
    _count++;
    notifyListeners();
  }

  void decrementCount() {
    _count--;
    notifyListeners();
  }
}
