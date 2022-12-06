import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../testing/statemanager.dart';

class SettingsButton extends StatefulWidget{

  const SettingsButton({super.key});

  @override
  createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton>{

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: TextButton(
          onPressed: () {
            Provider.of<StateManager>(context, listen: false).setCurrentState("SettingsPage");
          },
          child: const Icon(
            Icons.settings,
            size: 40,
            color: Colors.black,
          ),
        )
    );
  }

}