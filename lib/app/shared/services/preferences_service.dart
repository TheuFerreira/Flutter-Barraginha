import 'package:shared_preferences/shared_preferences.dart';

abstract class IPreferencesService {
  Future<bool> getShowTutorial();
  void setShowTutorial(bool value);
}

class PreferencesService implements IPreferencesService {
  @override
  Future<bool> getShowTutorial() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("show_tutorial")) {
      return true;
    }

    return prefs.getBool("show_tutorial")!;
  }

  @override
  void setShowTutorial(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('show_tutorial', value);
  }
}
