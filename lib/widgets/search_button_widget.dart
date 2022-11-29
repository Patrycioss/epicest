import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../managers/search_manager.dart';

class SearchButton extends StatefulWidget
{
  const SearchButton({super.key});

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton>
{
  void getSuggestions() async
  {
    List<SearchInfo> suggestions;
    suggestions = await addressSuggestion(SearchManager.textEditingController.text, limitInformation: 4);

    suggestions.removeWhere((element) => element.point == null);

    SearchManager.newSuggestions(suggestions);
  }

  @override
  Widget build(BuildContext context){
    return TextButton(
      onPressed: () {
        getSuggestions();
      },
      child: const Text(
        'search',

        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}