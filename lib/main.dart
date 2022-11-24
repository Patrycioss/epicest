import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    List<SearchInfo> suggestions = <SearchInfo>[];

    final TextEditingController textController = TextEditingController();

    return MaterialApp(
      title: 'TestApp',
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 50, 5),
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term'
              ),
            ),
          ),
          actions:  [
            SearchButton(textController, suggestions),
          ]
      ),
        body: const InAppMap(),
      ),
    );
  }
}

class _SearchButtonState extends State<SearchButton>
{
  @override

  Future<List<SearchInfo>> getSuggestions() async
  {
    List<SearchInfo> suggestions;
    suggestions = await addressSuggestion(widget.textController.text);

    for (SearchInfo searchInfo in suggestions)
     {
       print(searchInfo.address?.country.toString());
     }

    setState(() {

    });

    return suggestions;
  }


  Widget build(BuildContext context){
    return TextButton(
      onPressed: ()
      {
        print(widget.textController.text);
        getSuggestions();
       },

      child: Text(
          widget.textController.text,
          style: const TextStyle(
            color: Colors.red,
          ),
      ),
    );
  }
}

class SearchButton extends StatefulWidget
{
  final TextEditingController textController;
  List<SearchInfo> suggestions;
  SearchButton(this.textController, this.suggestions, {super.key});

  @override
  State<SearchButton> createState() => _SearchButtonState();
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

class InAppMap extends StatefulWidget
{
  const InAppMap({super.key});

  @override
  State<InAppMap> createState() => _InAppMapState();
}


// class _MyCustomWidgetState extends State<CustomWidget> {
//   String text = 'hi';
//   Color color = Colors.red;
//
//   void _changeText() {
//     setState(() {
//       text = 'hoi';
//     });
//   }
//
//   @Override
//   Widget build(BuildContext context)
//   {
//     return
//   }
//
// }

// class CustomWidget extends StatefulWidget {
//   const CustomWidget({super.key});
//
//   @override
//   State<CustomWidget> createState() => _MyCustomWidgetState();
// }
