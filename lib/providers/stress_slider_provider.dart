import 'package:flutter/foundation.dart';

class SliderProvider with ChangeNotifier {
  double _value = 0.0;

  double get value => _value;

  void setValue(double newValue) {
    _value = newValue;
    notifyListeners();
  }
}
