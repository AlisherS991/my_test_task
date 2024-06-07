import 'package:flutter/material.dart';

class MoodProvider with ChangeNotifier {
  String? _selectedMood;
  int _counter = 0;
  int _index = 0;

  String? get selectedMood => _selectedMood;
  int get counter => _counter;
  int get index => _index;
  void changeMood(String mood,int counter,int index) {
    _selectedMood = mood;
    _counter = counter;
    _index=index;
    notifyListeners();
  }
}
