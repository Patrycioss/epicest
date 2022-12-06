import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:provider/provider.dart';

import '../notifiers/suggestion_notifier.dart';

class _SearchBarState extends State<SearchBar>
{

  Timer? timer;
  int added = 0;

  void startTimer(bool favorites) {
    const oneSec = Duration(milliseconds: 200);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) => setState(() {
        if (added >= 1200) {
          timer.cancel();
          getSuggestions(favorites);
          print("Timer done!");
        }
        else {
          added = added + oneSec.inMilliseconds;
          print("Timer is going...");
        }
      },
      ),
    );
  }

  void getSuggestions(bool favorites) async
  {
    List<SearchInfo> suggestions;
    suggestions = await addressSuggestion(widget._textEditingController.text, limitInformation: 4);

    suggestions.removeWhere((element) => element.point == null);
    updateSuggestions(suggestions, favorites);
  }

  void updateSuggestions(List<SearchInfo> suggestions, bool favorites)
  {
    Provider.of<SuggestionNotifier>(context, listen: false).setNewSuggestions(suggestions, favorites);
  }

  @override
  Widget build(BuildContext context) {
    return Stack
    (
      children:
      [
        const Image
        (
          image: AssetImage('assets/search.png'),
        ),

        Container
        (
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(45, 25, 0, 0),
          child: TextField
          (
            maxLength: 22,
            controller: widget._textEditingController,
            decoration:
              const InputDecoration
              (
                counter: SizedBox.shrink(),
                border: InputBorder.none,
                hintText: 'Enter a search term'
              ),
              onChanged: (String value){
                if(timer == null){
                  startTimer(widget.favorites);
                }
                else {
                  timer?.cancel();
                  startTimer(widget.favorites);
                }
              },
          ),
        ),
      ]
    );
  }
}

class SearchBar extends StatefulWidget
{
  final TextEditingController _textEditingController;
  final bool favorites;
  const SearchBar(this._textEditingController, this.favorites,{super.key});

  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

