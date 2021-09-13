
import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier{

  ThemeChanger(int theme){
    switch(theme){
      case 1 :
      _darkTheme = false;
      _customTheme = false;
      _currentTheme = ThemeData.light();
      break;
      case 2:
      _darkTheme = true;
      _customTheme = false;
      _currentTheme = ThemeData.dark();
      break;
      case 3:
      _darkTheme = false;
      _customTheme = true;
      break;
      default:
      _darkTheme = false;
      _customTheme = false;
      _currentTheme = ThemeData.light();
    }
  }

  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light(); 

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme =>this._currentTheme;

  set darkTheme (bool value) {
    _customTheme = false;
    _darkTheme = value;
    if(value){
      _currentTheme = ThemeData.dark();
    }else{
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  set customTheme (bool value) {
    _darkTheme = false;
    _customTheme = value;
    if(value){
      _currentTheme = ThemeData.light();
    }else{
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }


}