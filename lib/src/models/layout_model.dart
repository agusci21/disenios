import 'package:disenios_01/src/pages/slide_show_page.dart';
import 'package:flutter/material.dart';

class LayoutModel extends ChangeNotifier{

  Widget _currentPage = SlideShowPage();
  Widget get currentPage => this._currentPage;
  set currentPage (Widget page){
    this._currentPage = page;
    notifyListeners();
  }
  
}