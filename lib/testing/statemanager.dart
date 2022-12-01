import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../widgets/main_screen.dart';
import '../widgets/settings_widget.dart';

class StateManager extends ChangeNotifier{

  String _currentState = "";
  HashMap<String, Widget> widgets = HashMap<String, Widget>();

  StateManager(){
    widgets.addAll({"MainPage": const MainScreen()});
    widgets.addAll({"SettingsPage": const SettingsWidget()});
    setCurrentState(widgets.entries.first.key);
  }

  void setCurrentState(String state){
    _currentState = state;
    notifyListeners();
  }

  String getCurrentState(){
    return _currentState;
  }
  
  void addWidget(String key, Widget widget){
    widgets.addAll({});
  }
}