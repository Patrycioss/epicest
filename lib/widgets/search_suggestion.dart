import 'package:epicest_project/managers/map_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../utils/information.dart';

class SearchSuggestion extends StatelessWidget
{
  final SearchInfo searchInfo;
  const SearchSuggestion(this.searchInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Information.i.appSize.width/2,
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

            if (searchInfo.point != null) {
              MapManager.setPositionOnMap(searchInfo.point!);
            }
          },
          child: const Text(
            'booger',
          ),
        )
    );
  }
}