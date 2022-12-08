
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class Information
{
  late Size appSize;

  static late Information i;

  static GeoPoint epyDrost = GeoPoint(latitude: 52.2196098, longitude: 6.889513540917904);

  Information(this.appSize){
    i = this;
  }

}