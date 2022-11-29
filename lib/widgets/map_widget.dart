import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class InAppMap extends StatefulWidget
{
  const InAppMap({super.key});

  @override
  State<InAppMap> createState() => _InAppMapState();
}

class _InAppMapState extends State<InAppMap>
{
  @override
  Widget build(BuildContext context) {

    MapController mapController = MapController(
      initMapWithUserPosition: false,
      initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
      areaLimit: BoundingBox( east: 10.4922941, north: 47.8084648, south: 45.817995, west: 5.9559113,),
    );


    return Scaffold(
        body: OSMFlutter(
          controller:mapController,
          trackMyPosition: false,
          initZoom: 12,
          minZoomLevel: 2,
          maxZoomLevel: 19,
          stepZoom: 1.0,
          userLocationMarker: UserLocationMaker(
            personMarker: const MarkerIcon(
              icon: Icon(
                Icons.location_history_rounded,
                color: Colors.red,
                size: 48,
              ),
            ),
            directionArrowMarker: const MarkerIcon(
              icon: Icon(
                Icons.double_arrow,
                size: 48,
              ),
            ),
          ),
          roadConfiguration: RoadConfiguration(
            startIcon: const MarkerIcon(
              icon: Icon(
                Icons.person,
                size: 64,
                color: Colors.brown,
              ),
            ),
            roadColor: Colors.yellowAccent,
          ),
          markerOption: MarkerOption(
              defaultMarker: const MarkerIcon(
                icon:  Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue,
                  size: 56,
                ),
              )
          ),
        )
    );
  }
}