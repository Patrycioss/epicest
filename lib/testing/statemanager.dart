import 'dart:collection';

import 'package:epicest_project/favorites/favorites.dart';
import 'package:flutter/material.dart';

import '../widgets/IntroScreen.dart';
import '../widgets/main_screen.dart';
import '../widgets/settings_widget.dart';

class StateManager extends ChangeNotifier{

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String _currentState = "";
  final Favorites _favorites = Favorites();
  HashMap<String, Widget> widgets = HashMap<String, Widget>();

  StateManager(){
    widgets.addAll({"IntroPage": IntroScreen()});
    widgets.addAll({"MainPage": MainScreen(_favorites)});
    widgets.addAll({"SettingsPage": SettingsWidget(_favorites, _scaffoldKey)});
    setCurrentState("IntroPage");
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