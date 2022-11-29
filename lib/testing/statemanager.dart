import 'dart:collection';

import 'package:flutter/cupertino.dart';

class StateManager{
  String currentState = "";
  HashMap<String, Widget> widgets = HashMap<String, Widget>();
}