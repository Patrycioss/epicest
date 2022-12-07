import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/information.dart';
import 'favorites.dart';

class NotificationFavorite extends StatefulWidget{

  const NotificationFavorite({super.key});

  @override
  createState() => _NotificationFavoriteState();

}

class _NotificationFavoriteState extends State<NotificationFavorite>{

  Timer? timer;
  int added = 0;
  bool timerOn = false;

  void startTimer() {
    const oneSec = Duration(milliseconds: 200);
    timer = Timer.periodic(
      oneSec,
        (Timer timer) => setState(() {
          if (added >= 1600) {
            print("Tested");
            timer.cancel();
            Provider.of<Favorites>(context,listen: false).setVisible(false);
            timerOn = false;
            added = 0;
          }
          else {
            print("Testing");
            added = added + oneSec.inMilliseconds;
          }
        },
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Favorites>(
        builder: (BuildContext context, favorites, Widget? child){
          if(favorites.visible && !timerOn){
            timerOn = true;
            startTimer();
          }
          return Visibility(
            visible: favorites.visible,
            child: Opacity(
                opacity: 1.0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    width: Information.i.appSize.width * 0.7,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors:
                          [
                            Color(0xFFA0CFEC),
                            Color(0xFF71C6C9),
                            Color(0xFF57B2B7)
                          ]
                      ),
                      border: Border.all(
                          color: const Color(0xFF000000),
                          width: 1.0,
                          style: BorderStyle.solid
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Center(
                        child: Text(
                            "The favorite has been added!"
                        )
                    ),
                  ),
                )
            ),
          );
        }
    );
  }

}