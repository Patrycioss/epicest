import 'package:flutter/material.dart';

import 'utils/information.dart';
import 'managers/map_manager.dart';
import 'managers/search_manager.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'TestApp',
      home: Builder(
          builder: (context) {

          Information(MediaQuery.of(context).size);
          MapManager();

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
                toolbarHeight: 50 + (SearchManager.searchSuggestions.length * 50),

              flexibleSpace: SearchManager.searchWidget,
              actions:  [
                SearchManager.searchButton,
              ],
            ),
            body: MapManager.inAppMap,
          );
        }
      ),
    );
  }
}