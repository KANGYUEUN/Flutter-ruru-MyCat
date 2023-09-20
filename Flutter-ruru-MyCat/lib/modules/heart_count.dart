import 'package:flutter/foundation.dart';

class HeartCountProvider with ChangeNotifier {
  int _heartCount = 0;

  int get heartCount => _heartCount;

  void incrementHeartCount() {
    _heartCount++;
    notifyListeners();
  }

  void decrementHeartCount() {
    if (_heartCount > 0) {
      _heartCount--;
      notifyListeners();
    }
  }
}
