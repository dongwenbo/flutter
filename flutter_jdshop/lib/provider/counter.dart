import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  int getCount() => _count;
  addCount() {
    _count++;
    notifyListeners();
  }
}