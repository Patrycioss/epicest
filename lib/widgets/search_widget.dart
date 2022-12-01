import 'package:flutter/material.dart';

import '../managers/search_manager.dart';
import '../utils/information.dart';

class _SearchWidgetState extends State<SearchWidget>
{
  void refresh()
  {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Container
      (
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.fromLTRB(50, 25, 0, 0),
        child:
          Column
          (
            crossAxisAlignment: CrossAxisAlignment.start,

            children:
            [
              Flexible
              (
                child: SearchManager.searchInput,
              ),

              Container
              (
                width: Information.i.appSize.width/2,
                decoration:
                  BoxDecoration
                  (
                    color: Colors.indigo,
                    border:
                      Border.all
                      (
                        color: Colors.black,
                      ),

                    borderRadius:
                      const BorderRadius.all
                      (
                        Radius.circular(10)
                      ),
                  ),
                child:
                  Column
                  (
                    children: SearchManager.searchSuggestions,
                  )
              ),
            ],
          ),
      );
  }
}

class SearchWidget extends StatefulWidget
{
  const SearchWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SearchWidgetState();

  void refresh()
  {

  }

}