import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../favorites/favorites_menu.dart';
import '../testing/statemanager.dart';

class SettingsWidget extends StatefulWidget{

  const SettingsWidget({super.key});

  @override
  createState() => _SettingsWidget();
}

class _SettingsWidget extends State<SettingsWidget>{

  Timer? timer;
  int start = 10;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(() {
        if (start < 1) {
          timer.cancel();
          print("Timer done!");
        }
        else {
          start = start - 1;
          print("Timer is going...");
        }
      },
      ),
    );
  }

  @override
  void initState() {
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
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
              ),
              /*RawKeyboardListener(//for physical keyboard press
                focusNode: FocusNode(),
                onKey: (RawKeyEvent event) {
                  print(event.data.logicalKey.keyId);
                  if (event.runtimeType == RawKeyDownEvent  &&
                      (event.logicalKey.keyId == 4295426088))//Enter Key ID from keyboard
                      {
                    print("asdadda");
                  }
                },//for physical keyboard press
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: "Phone"),
                  validator: (val) => val?.length == 0 ? 'Enter your phone' : null,
                  onSaved: (val) => this.phone = val,
                  onFieldSubmitted: (_) async {
                    print("asdadda");
                    submitContact();
                  },
                ),
              ),*/
              TextButton(
                onPressed: () {

                },
                child: const Text(
                  "Submit"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}