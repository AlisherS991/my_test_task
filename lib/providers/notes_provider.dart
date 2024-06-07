import 'package:flutter/foundation.dart';

class NotesProvider with ChangeNotifier {
  String _value = '';

  String get value => _value;

  void setValue(String newValue) {
    _value = newValue;
    notifyListeners();
  }
}
