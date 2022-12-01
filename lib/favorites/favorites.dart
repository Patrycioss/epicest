import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../widgets/search_suggestion.dart';

class Favorites extends ChangeNotifier{

  final List<SearchSuggestion> _suggestions = [];
  UnmodifiableListView<SearchSuggestion> get suggestions => UnmodifiableListView(_suggestions);

  void addFavorite(SearchSuggestion suggestion){
    _suggestions.add(suggestion);
  }


}