import 'package:epicest_project/widgets/settings_button_widget.dart';
import 'package:flutter/material.dart';

import '../favorites/favorites_menu.dart';
import '../managers/map_manager.dart';
import '../managers/search_manager.dart';
import '../utils/information.dart';

class MainScreen extends StatefulWidget{

  const MainScreen({super.key});

  @override
  createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen>
{
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {

          Information(MediaQuery.of(context).size);
          MapManager();

          return Scaffold(
            drawer: const FavoritesMenu(),
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
              toolbarHeight: 50 + (SearchManager.searchSuggestions.length * 50),

              flexibleSpace: SearchManager.searchWidget,
              actions:  [
                SearchManager.searchButton,
                const SettingsButton(),
              ],
            ),
            body: MapManager.inAppMap,
          );
        }
    );
  }

}