

import 'package:flutter/material.dart';
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
            },
          ),
          ListTile(
            title: const Text('Hogeschool Saxion - Edith Stein'),
            subtitle: const Text("Placeholder"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
