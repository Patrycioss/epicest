import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class InformationNotifier extends ChangeNotifier
{
  bool _visible = false;
  bool get visible => _visible;

  void setVisibility(bool visible)
  {
    _visible = visible;
    notifyListeners();
  }
}