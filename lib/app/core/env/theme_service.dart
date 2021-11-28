import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeService {
  bool isDark = false;
  final _getStorage = GetStorage();

  final storageKey = "isDarkMode";

  ThemeMode getThemeMode() {
    return isSaveDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isSaveDarkMode() {
    return _getStorage.read(storageKey) ?? false;
  }

  void saveThemeMode(bool isDarkMode) {
    isDark = isDarkMode;
    _getStorage.write(storageKey, isDarkMode);
  }

  void changeThemeMode() {
    Get.changeThemeMode(isSaveDarkMode() ? ThemeMode.light : ThemeMode.dark);

    saveThemeMode(!isSaveDarkMode());
  }
}
