import 'package:flutter/material.dart';

import '../managers/search_manager.dart';

class SearchInputWidget extends StatelessWidget
{
  const SearchInputWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return TextField (
      controller: SearchManager.textEditingController,
      decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow),
          ),
          hintText: 'Enter a search term'
      ),
    );
  }
}