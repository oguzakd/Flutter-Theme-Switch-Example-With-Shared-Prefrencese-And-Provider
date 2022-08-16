import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData green = ThemeData(
    buttonColor: Colors.green.shade300,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green.shade50);

ThemeData red = ThemeData(
    buttonColor: Colors.red.shade300,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red.shade50);

class ThemeColorData with ChangeNotifier{
  SharedPreferences? _sharedPreferencesObject;


  bool _isGreen = true;

  ThemeData get themeColor{
    return _isGreen ? green:red;
  }

  bool get isGreen => _isGreen;

  void toggleTheme(){
    _isGreen =!_isGreen;
    saveThemeFromSharedPreferences(_isGreen);
    notifyListeners();
  }

  Future<void> creatSharedPreferencesObject() async{
    _sharedPreferencesObject = await SharedPreferences.getInstance();
  }

  void saveThemeFromSharedPreferences(bool value){
    _sharedPreferencesObject!.setBool('themeData', value);
  }

  void loadThemeFromSharedPreferences() async{

    await creatSharedPreferencesObject();

    if(_sharedPreferencesObject!.getBool('themeData') == null){
      _isGreen = true;
    }else{
      _isGreen = _sharedPreferencesObject!.getBool('themeData')!;
    }
  }
}