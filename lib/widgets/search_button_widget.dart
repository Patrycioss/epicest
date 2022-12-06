/*
import 'package:epicest_project/notifiers/suggestion_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:provider/provider.dart';

class SearchButton extends StatefulWidget
{
  final TextEditingController _textEditingController;
  const SearchButton(this._textEditingController,{super.key});

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton>
{
  String previousSearch = '';


  void getSuggestions() async
  {
    if (previousSearch == widget._textEditingController.text || widget._textEditingController.text.isEmpty) return;

    List<SearchInfo> suggestions;
    suggestions = await addressSuggestion(widget._textEditingController.text, limitInformation: 4);

    suggestions.removeWhere((element) => element.point == null);
    updateSuggestions(suggestions);

    previousSearch = widget._textEditingController.text;
  }

  void updateSuggestions(List<SearchInfo> suggestions)
  {
    Provider.of<SuggestionNotifier>(context, listen: false).setNewSuggestions(suggestions, false);
    Provider.of<SuggestionNotifier>(context, listen: false).setVisibility(true);
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
}*/
