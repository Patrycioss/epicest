import 'package:flutter/material.dart';

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
              Column
              (
                children:
                [
                 const  Image(
                    image: AssetImage('assets/epy_drost_banner.png'),

                  ),
                  Container(
                    color: Colors.white,
                    child: const ListTile
                    (
                      leading: Icon(Icons.school),
                      title: Text('Epy Drost'),
                      subtitle: Text('Saxion University of Applied Sciences Enschede'),
                    ),
                  ),
                ],
              )
        ),
        Visibility(
          visible: _showEpyInformation,
          child:
          Container(
            color: Colors.white,
            child: const ListTile(
              leading: Text('Awesome text about Epy Drost'),
            ),
          ),
        ),
      ],
    );
  }
}