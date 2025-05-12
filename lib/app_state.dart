import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _HasReseult = false;
  bool get HasReseult => _HasReseult;
  set HasReseult(bool value) {
    _HasReseult = value;
  }

  bool _HasNotifications = false;
  bool get HasNotifications => _HasNotifications;
  set HasNotifications(bool value) {
    _HasNotifications = value;
  }
}
