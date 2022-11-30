import 'package:epicest_project/notifiers/map_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:provider/provider.dart';

import '../utils/information.dart';

class SearchSuggestion extends StatelessWidget
{
  final SearchInfo searchInfo;
  const SearchSuggestion(this.searchInfo,{super.key});

  @override
  Widget build(BuildContext context) {

    String string;


    return Container(
        width: Information.i.appSize.width,
        decoration: BoxDecoration(
          color: Colors.indigo,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: TextButton(
          onPressed: ()
          {
            if (kDebugMode) print('Click');
            Provider.of<MapNotifier>(context, listen: false).setPoint(searchInfo.point!);
          },
          style: const ButtonStyle(
            alignment: Alignment.center,
          ),
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              searchInfo.address.toString(),
            ),
          )
        )
    );
  }
}