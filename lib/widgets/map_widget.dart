import 'package:epicest_project/notifiers/map_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:provider/provider.dart';
import '../notifiers/suggestion_notifier.dart';

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

    Provider.of<MapNotifier>(context, listen: false)
        .mapController.addMarker
      (
        GeoPoint
        (
          latitude: 52.219772238231606,
          longitude: 6.889461611120473
        )
      , markerIcon:
          const MarkerIcon
          (
            icon:
              Icon
              (
                Icons.school,
                color: Colors.green,
                size: 70,
              ),
          )
    );

    return GestureDetector(
      onTapDown: (TapDownDetails details){
        FocusScope.of(context).unfocus();
        Provider.of<SuggestionNotifier>(context,listen: false).setVisibility(false);
      },
      onTap: (){
        FocusScope.of(context).unfocus();
        Provider.of<SuggestionNotifier>(context,listen: false).setVisibility(false);
      },
      child:
        OSMFlutter
          (
          controller: Provider.of<MapNotifier>(context, listen: false).mapController,
          trackMyPosition: false,
          initZoom: 12,
          minZoomLevel: 2,
          maxZoomLevel: 19,
          stepZoom: 1.0,
          onLocationChanged: (GeoPoint point) {
            print("Test");
          },
          userLocationMarker:
          UserLocationMaker(
            personMarker:
            const MarkerIcon(
              icon:
              Icon
                (
                Icons.location_history_rounded,
                color: Colors.red,
                size: 48,
              ),
            ),

            directionArrowMarker:
            const MarkerIcon
              (
              icon:
              Icon
                (
                Icons.double_arrow,
                size: 48,
              ),
            ),
          ),

          roadConfiguration:
          RoadConfiguration
            (
            startIcon:
            const MarkerIcon
              (
              icon:
              Icon
                (
                Icons.person,
                size: 64,
                color: Colors.brown,
              ),
            ),
            roadColor: Colors.yellowAccent,
          ),

          markerOption:
          MarkerOption
            (
              defaultMarker:
              const MarkerIcon
                (
                icon:
                Icon
                  (
                  Icons.person_pin_circle,
                  color: Colors.blue,
                  size: 56,
                ),
              )
          ),
        ),
      );
  }
}