import 'package:epicest_project/notifiers/information_notifier.dart';
import 'package:epicest_project/notifiers/map_notifier.dart';
import 'package:epicest_project/notifiers/suggestion_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:provider/provider.dart';

import '../build_context_storer/build_context_storer.dart';
import '../favorites/favorites.dart';
import '../utils/information.dart';

class SearchSuggestion extends StatelessWidget
{
  final SearchInfo searchInfo;
  final bool favorites;
  const SearchSuggestion(this.searchInfo, this.favorites, {super.key});

  @override
  Widget build(BuildContext context) {

    String string = '';


    if (searchInfo.address != null)
    {
      if (searchInfo.address!.country != null) string += searchInfo.address!.country!;
      string += '  ';

      if (searchInfo.address!.name != null) string += searchInfo.address!.name!;
      string += '  ';

      if (searchInfo.address!.street != null) string += searchInfo.address!.street!;
      string += '  ';

      if (searchInfo.address!.postcode != null) string += searchInfo.address!.postcode!;
      string += '  ';
    }


    return Container(
        width: Information.i.appSize.width*0.9,
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
            if(!favorites){
              Provider.of<SuggestionNotifier>(context,listen: false).setVisibility(false);
              Provider.of<MapNotifier>(context, listen: false).setPoint(searchInfo);
              Provider.of<InformationNotifier>(context,listen: false).setVisibility(true);
            }
            else{
              print("Booger");
              Provider.of<Favorites>(context, listen: false).addFavorite(searchInfo);
              Provider.of<SuggestionNotifier>(context, listen: false).setVisibility(false);

            }
          },
          style: const ButtonStyle(
            alignment: Alignment.center,
          ),
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              string,
            ),
          )
        )
    );
  }
}