import 'package:epicest_project/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import '../widgets/search_button_widget.dart';
import '../widgets/search_input_widget.dart';
import '../widgets/search_suggestion.dart';

class SearchManager
{
  static SearchWidget searchWidget = const SearchWidget();
  static SearchInputWidget searchInput = const SearchInputWidget();
  static SearchButton searchButton = const SearchButton();
  static TextEditingController textEditingController = TextEditingController();

  static List<SearchSuggestion> searchSuggestions = [];

  static void newSuggestions(List<SearchInfo> suggestions)
  {
    searchSuggestions.clear();

    for (SearchInfo suggestion in suggestions) {
      searchSuggestions.add(SearchSuggestion(suggestion));
    }

    searchWidget.refresh();
  }
}