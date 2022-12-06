import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapNotifier extends ChangeNotifier
{
  late GeoPoint _geoPoint = GeoPoint(latitude: 52.220852, longitude: 6.890950);
  late SearchInfo _searchInfo;

  late final MapController _mapController = MapController(
    initMapWithUserPosition: false,
    initPosition: _geoPoint,
    areaLimit: BoundingBox( east: 10.4922941, north: 47.8084648, south: 45.817995, west: 5.9559113,),
  );

  GeoPoint get geoPoint => _geoPoint;
  MapController get mapController => _mapController;
  SearchInfo get searchInfo => _searchInfo;

  void setPoint(SearchInfo searchInfo) async
  {
    _geoPoint = searchInfo.point!;
    _searchInfo = searchInfo;
    _moveAndZoom();
  }

  void _moveAndZoom() async
  {
    await _mapController.goToLocation(_geoPoint);

    if (searchInfo.address!.postcode != null)
    {
      await _mapController.setZoom(zoomLevel: 19, stepZoom: 5);
    }
    else {
      await _mapController.setZoom(zoomLevel: 10, stepZoom: 5);
      _mapController.addMarker(_geoPoint, markerIcon:const MarkerIcon(
          icon: Icon(
            Icons.location_city,
            color: Colors.red,
            size: 100,
          )));
    }

  }
}