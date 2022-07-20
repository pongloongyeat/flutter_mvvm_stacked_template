import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_stacked_template/app/app.dart';

typedef ShowDialogCallback = Future<void> Function(
  String title,
  String content,
);

class AppColors {
  static const primaryColor = Color(0xffffffff);
}

class AnimationDefaults {
  static const defaultAnimationDuration = Duration(milliseconds: 300);
  static const defaultAnimationCurve = Curves.easeInOut;
}

class ApiDefaults {
  static String baseUrl() {
    switch (AppConfig.environment) {
      case Environment.development:
        return 'https://development/';
      case Environment.staging:
        return 'https://staging/';
      case Environment.production:
        return 'https://production/';
    }
  }

  static const defaultTake = 20;
  static const defaultSkip = 0;
  static const connectTimeoutInMilliseconds = 30 * 1000;
  static const receiveTimeoutInMilliseconds = 30 * 1000;
}

class ScrollDefaults {
  static const loadMoreDataScrollThreshold = 0.8;
}
