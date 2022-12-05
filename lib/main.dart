
import 'testing/statemanager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => StateManager(),
      child: const MyApp(),
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