import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:provider/provider.dart';

import '../notifiers/suggestion_notifier.dart';

class _SearchBarState extends State<SearchBar>
{

  Timer? timer;
  int added = 0;

  void startTimer() {
    const oneSec = Duration(milliseconds: 200);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) => setState(() {
        if (added >= 1200) {
          timer.cancel();
          getSuggestions();
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

  void getSuggestions() async
  {
    List<SearchInfo> suggestions;
    suggestions = await addressSuggestion(widget._textEditingController.text, limitInformation: 4);

    suggestions.removeWhere((element) => element.point == null);
    updateSuggestions(suggestions);
  }

  void updateSuggestions(List<SearchInfo> suggestions)
  {
    Provider.of<SuggestionNotifier>(context, listen: false).setNewSuggestions(suggestions, false);
  }

  @override
  Widget build(BuildContext context) {

    // _focusNode.addListener(() {
    //   Provider.of<SuggestionNotifier>(context, listen:false).setVisibility(_focusNode.hasFocus);
    //   print('hi');
    //   FocusScope.of(context).unfocus();
    // });



    return Container
    (
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(45, 25, 0, 0),
      child: TextField (
        // focusNode: _focusNode,
        // onTap: ()
        // {
        //   if (_focusNode.hasFocus) {
        //     _focusNode.unfocus();
        //
        //   } else if (!_focusNode.hasFocus) {
        //     _focusNode.focusInDirection(TraversalDirection.left);
        //   }
        // },

        onEditingComplete: (){
          print("oneditting");
        },
        onSubmitted: (String string){
          print("onsubmitted");
        },

        controller: widget._textEditingController,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter a search term'
        ),
        onChanged: (String value){
          if(timer == null){
            startTimer();
          }
          else {
            timer?.cancel();
            startTimer();
          }
        },
      ),
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

