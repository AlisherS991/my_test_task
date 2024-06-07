import 'package:flutter/material.dart';

class FeelingProvider with ChangeNotifier {
  String? _selectedFeeling;

  String? get selectedFeeling => _selectedFeeling;

  void changeMood(String feeling) {
    _selectedFeeling = feeling;
    notifyListeners();
  }
}
