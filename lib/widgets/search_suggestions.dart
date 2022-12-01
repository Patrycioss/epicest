import 'package:epicest_project/notifiers/suggestion_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _SearchSuggestionsState extends State<SearchSuggestions>
{
  @override
  Widget build(BuildContext context) {
    return Consumer<SuggestionNotifier>
    (
      builder: (context, notifier, child) =>
        Column
        (
          children: notifier.suggestions,
        ),
    );
  }
}

class SearchSuggestions extends StatefulWidget
{
  const SearchSuggestions({super.key});
  @override
  State<StatefulWidget> createState() => _SearchSuggestionsState();
}