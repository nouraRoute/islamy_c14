import 'package:flutter/material.dart';
import 'package:islamy_c14/common/app_theme.dart';

class BasicProvider extends ChangeNotifier {
  ThemeMode curantTheme = ThemeMode.dark;
  editTheme() {
    if (curantTheme == ThemeMode.dark) {
      curantTheme = ThemeMode.light;
    } else {
      curantTheme = ThemeMode.dark;
    }
    print('XXXX');
    notifyListeners();
  }
}
