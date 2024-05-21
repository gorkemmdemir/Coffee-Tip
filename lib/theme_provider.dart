import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  Color _backgroundColor = Colors.brown[100]!;

  Color get backgroundColor => _backgroundColor;

  void setBackgroundColor(Color color) {
    _backgroundColor = color;
    notifyListeners();
  }
}