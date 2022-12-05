import 'package:flutter/material.dart';

class _SearchBarState extends State<SearchBar>
{
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
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
          ),
        ),
      ]
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

