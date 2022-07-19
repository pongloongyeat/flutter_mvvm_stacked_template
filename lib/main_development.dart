import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_stacked_template/app/app.dart';

void main() {
  AppConfig.environment = Environment.development;
  AppConfig.initaliseApp();
  runApp(const App());
}
