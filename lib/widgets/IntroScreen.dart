import 'dart:async';

import 'package:epicest_project/testing/statemanager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget
{
  const IntroScreen({super.key});

  @override
  State<StatefulWidget> createState() => _IntroScreenState();
}


class _IntroScreenState extends State<IntroScreen> {


  @override
  Widget build(BuildContext context) {

    const oneSec = Duration(milliseconds: 200);
    int added = 0;
    late Timer timer;
    return Lottie.asset('assets/splash_screen.json',
      onLoaded: (composition){
        Timer.periodic(
          oneSec,
              (Timer timer) => setState(() {
            if (added >= 4000) {
              print("Tested");
              timer.cancel();
              Provider.of<StateManager>(context, listen:false).setCurrentState("MainPage");
              added = 0;
            }
            else {
              print("Testing");
              added = added + oneSec.inMilliseconds;
            }
          },
          ),
        );
      });
  }
}