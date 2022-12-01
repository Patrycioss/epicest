import 'package:flutter/material.dart';

class _SearchBarState extends State<SearchBar>
{
  final FocusNode _focusNode = FocusNode();

  @override
  void initState()
  {
    super.initState();
    widget._textEditingController.addListener(() {
      final String text = widget._textEditingController.text;
      widget._textEditingController.value = widget._textEditingController.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
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
      margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
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
      ),
    );
  }
}

class SearchBar extends StatefulWidget
{
  final TextEditingController _textEditingController;
  const SearchBar(this._textEditingController,{super.key});

  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

