import 'package:flutter/material.dart';

class _SearchBarState extends State<SearchBar>
{
  @override
  Widget build(BuildContext context) {
    return Container
    (
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: TextField (
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

