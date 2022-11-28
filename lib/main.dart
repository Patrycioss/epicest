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
              drawer: FavoritesMenu(this),
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

  @override
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

class _MyHomePageState extends State<MyHomePage> {
  bool iffing = false;
  void setIffing(bool iffing){
    setState(() {
      this.iffing = iffing;
    });
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    if(!iffing) {
      return Scaffold(
        drawer: FavoritesMenu(this),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
    else{
      return const MyWidth();
    }
  }
}

class MyWidth extends StatelessWidget{

  const MyWidth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Test"),
      ),
    );
  }

}

class FavoritesMenu extends StatefulWidget {
  final _MyHomePageState page;

  const FavoritesMenu(this.page, {super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<FavoritesMenu> createState() => _FavoritesMenu(state: this.page);
}

class _FavoritesMenu extends State<FavoritesMenu>{
  _MyHomePageState state;

  _FavoritesMenu({required this.state});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: SelectionContainer.disabled(child:
              Text(
                  'Favorites',
                  style: TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold)
              ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Favorite one'),
            subtitle: const Text("My house"),
            onTap: () {
              widget.page.setIffing(true);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Favorite two'),
            subtitle: const Text("My booger"),
            onTap: () {
              widget.page.setIffing(true);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
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
