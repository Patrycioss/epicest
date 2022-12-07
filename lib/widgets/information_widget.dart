import 'package:epicest_project/utils/information.dart';
import 'package:flutter/material.dart';

class InformationWidget extends StatefulWidget
{
  const InformationWidget({super.key});
  @override
  State<StatefulWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget>
{
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: Information.i.appSize.height*0.4,
          child: Column
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
              Container(
                height: Information.i.appSize.height*0.15,
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 0, 0,0),
                child:
                  MediaQuery.removePadding(
                    context: (context),
                    removeTop: true,
                    child: ListView
                    (
                      addSemanticIndexes: true,
                      children:
                      const
                      [
                        Text('\u2022 Two Toilets - ground floor and 5th floor'),
                        Text('\u2022 4 elevators'),
                        Text('\u2022 No stairs blocking entrances to classrooms'),
                        Text('\u2022 Small pathways'),
                        Text('\u2022 Automatic door can be stopped and opened up to let in someone with a wheelchair'),
                      ],

                    ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
    // return Card(
    //   color: const Color.fromARGB(255, 160,207, 236),
    //   child: SizedBox(
    //     height: Information.i.appSize.height/4,
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: <Widget>[
    //         Container(
    //           decoration: const BoxDecoration(
    //             color: Color.fromARGB(255, 113,198, 201),
    //           ),
    //           child: const ListTile(
    //             leading: Icon(Icons.school),
    //             title: Text('Epy Drost'),
    //             subtitle: Text('Saxion University of Applied Sciences Enschede'),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

}