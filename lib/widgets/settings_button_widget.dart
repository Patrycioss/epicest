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
    return SizedBox(
        width: 50,
        child: TextButton(
          onPressed: () {
            Provider.of<StateManager>(context, listen: false).setCurrentState("SettingsPage");
          },
          child: const Image(
            image: AssetImage('assets/SettingsIcon.svg'),
            fit: BoxFit.cover,
          ),
      )
    );
  }

}