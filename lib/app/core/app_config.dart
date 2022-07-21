import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Environment { development, staging, production }

class AppConfig {
  const AppConfig._();

  static late Environment environment;

  static void initaliseApp() {
    WidgetsFlutterBinding.ensureInitialized();
    initialiseServices();
    initialiseFirebase();
  }

  static void initialiseServices() {
    _initialiseSharedPreferences();
  }

  static void initialiseFirebase() {}

  static void _initialiseSharedPreferences() {
    GetIt.instance.registerSingletonAsync(() async {
      final prefs = await SharedPreferences.getInstance();
      return SharedPreferencesService(prefs);
    });
  }
}
