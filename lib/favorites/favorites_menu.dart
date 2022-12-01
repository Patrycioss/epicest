

import 'package:epicest_project/notifiers/map_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:provider/provider.dart';

import '../testing/statemanager.dart';

class FavoritesMenu extends StatefulWidget {

  const FavoritesMenu({super.key});

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
                      fontSize: 40, fontWeight: FontWeight.bold)
              ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Hogeschool Saxion - Epy Drost'),
            subtitle: const Text("Placeholder"),
            onTap: () {
              Navigator.pop(context);
              Provider.of<MapNotifier>(context, listen: false).setPoint(SearchInfo(point: GeoPoint(latitude: 52.21979168320528, longitude: 6.889457162218579), address: Address()));
            },
          ),
          ListTile(
            title: const Text('Saxion University'),
            subtitle: const Text("Placeholder"),
            onTap: () {
              Navigator.pop(context);
              Provider.of<MapNotifier>(context, listen: false).setPoint(SearchInfo(point: GeoPoint(latitude: 52.21859095075787, longitude: 6.887492144103807), address: Address()));
            },
          ),
        ],
      ),
    );
  }
}
