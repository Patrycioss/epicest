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
    return Container(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: Information.i.appSize.height*0.25,
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
          ],
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