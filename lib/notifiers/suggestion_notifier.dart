import 'dart:collection';

import 'package:epicest_project/widgets/search_suggestion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class SuggestionNotifier extends ChangeNotifier
{
  bool _visible = true;
  bool get visible => _visible;

  final List<SearchSuggestion> _suggestions = [];
  UnmodifiableListView<SearchSuggestion> get suggestions => UnmodifiableListView(_suggestions);

  void setNewSuggestions(List<SearchInfo> suggestions)
  {
    _suggestions.clear();

    for (SearchInfo suggestion in suggestions) {
      _suggestions.add(SearchSuggestion(suggestion));
    }
    notifyListeners();
  }

  void clear()
  {
    _suggestions.clear();
    notifyListeners();
  }

  void setVisibility(bool visible)
  {
    _visible = visible;
    notifyListeners();
  }
}