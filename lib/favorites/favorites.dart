import 'package:epicest_project/build_context_storer/build_context_storer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:provider/provider.dart';

import '../notifiers/map_notifier.dart';
import '../testing/statemanager.dart';

class Favorites extends ChangeNotifier{

  final List<Widget> suggestions = [];

  /*Favorites(){
    SearchInfo info = SearchInfo(point: GeoPoint(latitude: 52.21979168320528, longitude: 6.889457162218579), address: Address(postcode: "7511 JL", city: "Enschede", street: "Van Galenstraat 19", country: "Netherlands"));
    String? name = info.address?.city;
    String? address = info.address?.postcode;
    String? street = info.address?.street;
    suggestions.add(
        ListTile(
          title: Text(name ?? "Not found"),
          subtitle: Text("${address ?? "Not found"} ${street ?? "Not found"}"),
          onTap: () {

          },
        ),
    );
  }*/

  void addFavorite(SearchInfo suggestion){
    String? state = suggestion.address?.state;
    String? country = suggestion.address?.country;
    String? city = suggestion.address?.city;
    String? postcode = suggestion.address?.postcode;
    String? street = suggestion.address?.street;
    String? name = suggestion.address?.name;
    suggestions.add(
      ListTile(
        title: Text(city ?? state ?? country ?? "Not found"),
        subtitle: Text("${name ?? ""} ${postcode ?? ""} ${street ?? ""}"),
        onTap: () {
          BuildContext? context = BuildContextStorer.context;
          Navigator.pop(context!);
          if(Provider.of<StateManager>(context, listen: false).getCurrentState().compareTo("MainPage") == 0){
            Provider.of<MapNotifier>(context!, listen: false).setPoint(SearchInfo(point: suggestion.point, address: suggestion.address));
          }
        },
      ),
    );
  }


}