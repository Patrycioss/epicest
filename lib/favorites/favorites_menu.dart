import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favorites.dart';

class FavoritesMenu extends StatefulWidget {
  final Favorites favorites;
  const FavoritesMenu(this.favorites, {super.key});

  @override
  State<FavoritesMenu> createState() => _FavoritesMenu();
}

class _FavoritesMenu extends State<FavoritesMenu>{

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
                      fontSize: 40, fontWeight: FontWeight.bold
                  )
              ),
              ),
            ),
          ),
          Column(
            children: [
              for(var i in Provider.of<Favorites>(context, listen: false).suggestions) i
            ],
          ),
          /*ChangeNotifierProvider(
            create: (context) => Favorites(),
            builder: (context, child) {
              return Column(
                children: [
                  for(var i in Provider.of<Favorites>(context, listen: false).suggestions) i
                ],
              );
            }
          ),*/
          /*ListTile(
            title: const Text('Hogeschool Saxion - Epy Drost'),
            subtitle: const Text("Placeholder"),
            onTap: () {
              Navigator.pop(context);
              Provider.of<MapNotifier>(context, listen: false).setPoint(SearchInfo(point: GeoPoint(latitude: 52.21979168320528, longitude: 6.889457162218579), address: Address(postcode: "7511 JL", city: "Enschede", street: "Van Galenstraat 19", country: "Netherlands")));
            },
          ),
          ListTile(
            title: const Text('Saxion University'),
            subtitle: const Text("Placeholder"),
            onTap: () {
              Navigator.pop(context);
              Provider.of<MapNotifier>(context, listen: false).setPoint(SearchInfo(point: GeoPoint(latitude: 52.21859095075787, longitude: 6.887492144103807), address: Address(postcode: "7511 JX", city: "Enschede", street: "Ariënsplein 1", country: "Netherlands")));
            },
          ),*/
        ],
      ),
    );
  }
}
