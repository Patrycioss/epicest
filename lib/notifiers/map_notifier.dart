import 'package:flutter/cupertino.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapNotifier extends ChangeNotifier
{
  late GeoPoint _geoPoint = GeoPoint(latitude: 52.220852, longitude: 6.890950);

  late final MapController _mapController = MapController(
    initMapWithUserPosition: false,
    initPosition: _geoPoint,
    areaLimit: BoundingBox( east: 10.4922941, north: 47.8084648, south: 45.817995, west: 5.9559113,),
  );

  GeoPoint get geoPoint => _geoPoint;
  MapController get mapController => _mapController;

  void setPoint(GeoPoint geoPoint)
  {
    _geoPoint = geoPoint;
    _moveAndZoom();
  }

  void _moveAndZoom() async
  {
    await _mapController.goToLocation(_geoPoint);

  }
}