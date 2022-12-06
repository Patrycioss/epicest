import 'dart:collection';

import 'package:epicest_project/favorites/favorites.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/main_screen.dart';
import '../widgets/settings_widget.dart';

class StateManager extends ChangeNotifier{

  String _currentState = "";
  final Favorites _favorites = Favorites();
  HashMap<String, Widget> widgets = HashMap<String, Widget>();

  StateManager(){
    widgets.addAll({"MainPage": MainScreen(_favorites)});
    widgets.addAll({"SettingsPage": SettingsWidget(_favorites)});
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