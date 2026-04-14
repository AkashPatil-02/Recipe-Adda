

import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider  = StateNotifierProvider<ThemeNotifier,bool>((ref){
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<bool>{
  ThemeNotifier() :super(false){
    loadTheme();
  }

  Future<void> loadTheme()async{
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool('isDark') ?? false;
  }

  Future<void> toggleTheme(bool value)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', value);
    state = value;
  }
}