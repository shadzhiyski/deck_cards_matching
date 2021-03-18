import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const bool IS_FULL_SCREEN_DEFAULT = false;
  static const double CARD_SHOW_FACE_UP_DURATION_IN_MILLISECONDS_DEFAULT = 1000;

  Future<bool> isFullScreenEnabled() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("Settings.fullScreenEnabled") ??
        IS_FULL_SCREEN_DEFAULT;
  }

  Future<void> setFullScreen(bool enableFullScreen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Settings.fullScreenEnabled", enableFullScreen);
  }

  Future<double> getCardShowFaceUpDurationInMilliseconds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble("Settings.cardShowFaceUpDurationInMilliseconds") ??
        CARD_SHOW_FACE_UP_DURATION_IN_MILLISECONDS_DEFAULT;
  }

  Future<void> setCardShowFaceUpDurationInMilliseconds(
      double enableFullScreen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(
        "Settings.cardShowFaceUpDurationInMilliseconds", enableFullScreen);
  }
}
