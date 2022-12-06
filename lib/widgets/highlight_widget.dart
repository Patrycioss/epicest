import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/information.dart';

class HighlightWidget extends StatefulWidget{

  const HighlightWidget({super.key});

  @override
  createState() => _HighlightWidgetState();

}

class _HighlightWidgetState extends State<HighlightWidget>{

  bool booger = false;
  void setBooger(bool booger){
    setState(() {
      this.booger = booger;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        /*width: Information.i.appSize.width * 0.95,*/
        // decoration: BoxDecoration(
        //   border: Border.all(
        //       width: 2,
        //       color: Colors.red
        //   )
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTapDown: (TapDownDetails details){
                setBooger(!booger);
              },
              child:
                const Image(
                  image: AssetImage('assets/epy_drost_banner.png'),
                )
            ),
            Visibility(
              visible: booger,
              child: Column(
                children: const [
                  Text(
                      "Deez"
                  ),
                  Text(
                      "Nuts"
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}