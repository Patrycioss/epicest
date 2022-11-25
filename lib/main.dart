import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {


  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'TestApp',
      home: Builder(
        builder: (context) {

          Size size = MediaQuery.of(context).size;
          List<SearchInfo> suggestions = <SearchInfo>[];

          final TextEditingController textController = TextEditingController();

          List<Container> suggestionWidgets = <Container>[];


          for (SearchInfo suggestion in suggestions)
          {
            suggestionWidgets.add(Container(
                width: size.width/2,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: TextButton(
                  onPressed: ()
                  {
                    if (kDebugMode) {
                      print('hello');
                    }
                  },
                  child: Text(
                    suggestion.address.toString(),
                  ),
                )
            )
            );
          }

          suggestionWidgets.add(BoogerGenerator(size));
          suggestionWidgets.add(BoogerGenerator(size));
          suggestionWidgets.add(BoogerGenerator(size));
          suggestionWidgets.add(BoogerGenerator(size));
          suggestionWidgets.add(BoogerGenerator(size));
          suggestionWidgets.add(BoogerGenerator(size));
          suggestionWidgets.add(BoogerGenerator(size));
          suggestionWidgets.add(BoogerGenerator(size));
          suggestionWidgets.add(BoogerGenerator(size));
          suggestionWidgets.add(BoogerGenerator(size));
          suggestionWidgets.add(BoogerGenerator(size));
          suggestionWidgets.add(BoogerGenerator(size));
          suggestionWidgets.add(BoogerGenerator(size));
          suggestionWidgets.add(BoogerGenerator(size));
          suggestionWidgets.add(BoogerGenerator(size));




          return Scaffold(

            appBar: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                )
              ),
              elevation: 8,

              backgroundColor: Colors.green,
                centerTitle: false,
                toolbarHeight: 50 + (suggestionWidgets.length * 50),
                flexibleSpace: Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      // width: 200,
                      // height: 200,
                      child: TextField (
                        controller: textController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow),
                            ),
                            hintText: 'Enter a search term'
                        ),
                      ),
                    ),
                    Container(
                        width: size.width/2,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: suggestionWidgets,
                        )
                    ),
                    ],
                ),
                ),
              actions:  [
                SearchButton(textController, suggestions),
              ],
            ),
            body: const InAppMap(),
          );
        }
      ),
    );
  }
}

class _SearchButtonState extends State<SearchButton>
{
  @override

  void getSuggestions() async
  {
    List<SearchInfo> suggestions;
    suggestions = await addressSuggestion(widget.textController.text);

    for (SearchInfo searchInfo in suggestions)
     {
       print(searchInfo.address?.country.toString());
     }

    setState(() {

    });
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

Container BoogerGenerator(Size size)
{
  return Container(
      width: size.width/2,
      decoration: BoxDecoration(
        color: Colors.indigo,
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        onPressed: ()
        {
          if (kDebugMode) {
            print('booger');
          }
        },
        child: Text(
          'booger',
        ),
      )
  );
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
