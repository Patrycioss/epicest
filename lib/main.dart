import 'package:epicest_project/testing/statemanager.dart';

import 'favorites/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StateManager()),
        ChangeNotifierProvider(create: (context) => Favorites()),
      ],
      builder: (context, child) {
        return const MyApp();
      }
    /*ChangeNotifierProvider(
      create: (context) => StateManager(),
      child: const MyApp(),*/
    ),
  );
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    StateManager stateManager = StateManager();
    Widget currentWidget = Container();

    stateManager.widgets.forEach((key, value) {
      if(key.compareTo(Provider.of<StateManager>(context).getCurrentState()) == 0){
        currentWidget = value;
      }
    });
    return MaterialApp(
      title: 'TestApp',
      home: currentWidget,
    );
  }
}