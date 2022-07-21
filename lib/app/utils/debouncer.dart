import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
  Debouncer(this.duration);

  final Duration duration;
  Timer? _timer;

  void call(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(duration, () {
      callback.call();
      _timer?.cancel();
    });
  }
}
