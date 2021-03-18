import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  Future<bool> isFullScreenEnabled() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("Settings.fullScreenEnabled") ?? false;
  }

  Future<void> setFullScreen(bool enableFullScreen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Settings.fullScreenEnabled", enableFullScreen);
  }

  Future<double> getCardShowFaceUpDurationInMilliseconds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble("Settings.cardShowFaceUpDurationInMilliseconds") ??
        1200;
  }

  Future<void> setCardShowFaceUpDurationInMilliseconds(
      double enableFullScreen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(
        "Settings.cardShowFaceUpDurationInMilliseconds", enableFullScreen);
  }
}
