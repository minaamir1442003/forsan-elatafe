import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences _prefs;
  static const String _hasSeenOnboarding = 'has_seen_onboarding';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // حفظ أن المستخدم شاهد الـ Onboarding
  static Future<void> setHasSeenOnboarding(bool value) async {
    await _prefs.setBool(_hasSeenOnboarding, value);
  }

  // التحقق إذا كان المستخدم قد شاهد الـ Onboarding من قبل
  static bool getHasSeenOnboarding() {
    return _prefs.getBool(_hasSeenOnboarding) ?? false;
  }


}