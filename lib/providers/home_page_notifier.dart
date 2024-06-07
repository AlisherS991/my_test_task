import 'package:flutter/material.dart';

class HomePageNotifier with ChangeNotifier {
  // Add any necessary state variables here
  // For example:
  bool _shouldRebuild = false;

  void triggerRebuild() {
    _shouldRebuild = true;
    notifyListeners();
  }

  bool get shouldRebuild => _shouldRebuild;
}