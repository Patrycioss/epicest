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
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFA0CFEC),
                    Color(0xFF71C6C9),
                    Color(0xFF57B2B7)
                  ]
              )
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
        ],
      ),
    );
  }
}
