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

  bool _showEpyInformation = false;
  void showEpyInformation(bool showEpyInformation){
    setState(() {
      _showEpyInformation = showEpyInformation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector
        (
          onTapDown: (TapDownDetails details){
            showEpyInformation(!_showEpyInformation);
          },
          child:
              Container(
                child: Column
                (
                  children:
                  [
                    Image(
                      image: AssetImage('assets/epy_drost_banner.png'),

                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile
                      (
                        leading: Icon(Icons.school),
                        title: Text('Epy Drost'),
                        subtitle: Text('Saxion University of Applied Sciences Enschede'),
                      ),
                    ),
                  ],
                ),
              )
        ),
        Visibility(
          visible: _showEpyInformation,
          child:
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Text('hi'),
            ),
          ),
        ),
      ],
    );
  }
}