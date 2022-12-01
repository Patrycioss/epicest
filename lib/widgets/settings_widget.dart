import 'dart:async';

import 'package:epicest_project/widgets/search_bar.dart';
import 'package:epicest_project/widgets/search_suggestions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../favorites/favorites_menu.dart';
import '../notifiers/suggestion_notifier.dart';
import '../testing/statemanager.dart';

class SettingsWidget extends StatefulWidget{

  const SettingsWidget({super.key});

  @override
  createState() => _SettingsWidget();
}

class _SettingsWidget extends State<SettingsWidget>{

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SuggestionNotifier()),
        ],
        builder: (context, child){
          return Scaffold(
            drawer: const FavoritesMenu(),
            appBar: AppBar(
                backgroundColor: Colors.green,
                actions: [
                  TextButton(
                    onPressed: () {
                      Provider.of<StateManager>(context, listen: false).setCurrentState("MainPage");
                    },
                    child: const Image(
                      image: AssetImage('assets/Marker.svg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ]

            ),
            body: Container(
              alignment: Alignment.topLeft,
              color: Colors.green,
              child: Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Add a favorite address!",
                    ),//for physical keyboard press
                    SearchBar(_controller, true),
                    Container
                      (
                      alignment: Alignment.center,
                      child: const SearchSuggestions(),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );

  }

}