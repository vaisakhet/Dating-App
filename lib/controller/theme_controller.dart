import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final _themeMode = ThemeMode.system.obs;
  ThemeMode get themeMode => _themeMode.value;

  bool get isDarkMode => _themeMode.value == ThemeMode.dark;

  @override
  void onInit() {
    _loadThemeMode();
    super.onInit();
  }

  Future<void> _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final themeModeIndex = prefs.getInt('theme_mode');
    if (themeModeIndex != null) {
      _themeMode.value = ThemeMode.values[themeModeIndex];
    }
    update();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    _themeMode.value = themeMode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', themeMode.index);
    Get.changeThemeMode(themeMode);
    update();
  }
}
