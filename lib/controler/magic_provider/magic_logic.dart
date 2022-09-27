import 'dart:math';

import 'package:flutter/cupertino.dart';

class MagicCounterclass extends ChangeNotifier {
  int _magicCount = 7;

  void changeCountValue() {
    _magicCount = Random().nextInt(7);
    notifyListeners();
  }

  void resetApp() {
    _magicCount = 7;
    notifyListeners();
  }

  int get magicCount => _magicCount;
}
