import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferencesKeys {
  accessToken,
  refreshToken,
}

class SharedPreferencesService {
  SharedPreferencesService(this.prefs);

  final SharedPreferences prefs;

  Future<bool> setAccessToken(String accessToken) {
    return prefs.setString(SharedPreferencesKeys.accessToken.name, accessToken);
  }

  String? getAccessToken() {
    return prefs.getString(SharedPreferencesKeys.accessToken.name);
  }

  Future<bool> clearAccessToken() {
    return prefs.remove(SharedPreferencesKeys.accessToken.name);
  }

  Future<bool> setRefreshToken(String refreshToken) {
    return prefs.setString(
      SharedPreferencesKeys.refreshToken.name,
      refreshToken,
    );
  }

  String? getRefreshToken() {
    return prefs.getString(SharedPreferencesKeys.refreshToken.name);
  }

  Future<bool> clearRefreshToken() {
    return prefs.remove(SharedPreferencesKeys.refreshToken.name);
  }
}
