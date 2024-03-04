import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/services/colors.dart';
import 'package:get_storage/get_storage.dart';


class ThemeService {
  final lightTheme = ThemeData.light().copyWith(
    textTheme:
        TextTheme(bodyText1: TextStyle(fontSize: 15, color: Colors.black)),
    primaryColor: Colors.blueGrey.shade300,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff026670),
    ),
    dividerColor: Colors.black12,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed, selectedItemColor: mainColor),
  );

  final darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white10,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff026670),
      ),
      textTheme:
          TextTheme(bodyText1: TextStyle(fontSize: 15, color: Colors.white)),
      dividerColor: Colors.white54,
      bottomAppBarTheme: BottomAppBarTheme(color: Colors.black),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0x333739),
          selectedItemColor: Colors.white,
          unselectedItemColor: mainColor));
  final _getStorage = GetStorage();

  final _darkThemeKey = 'isDarkTheme';

  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);

    saveThemeData(!isSavedDarkMode());
    return isSavedDarkMode();
  }
}
