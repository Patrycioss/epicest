import 'package:epicest_project/widgets/search_bar.dart';
import 'package:epicest_project/widgets/search_suggestions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../favorites/favorites.dart';
import '../favorites/favorites_menu.dart';
import '../notifiers/suggestion_notifier.dart';
import '../testing/statemanager.dart';
import 'highlight_widget.dart';

class SettingsWidget extends StatefulWidget{
  final Favorites favorites;
  const SettingsWidget(this.favorites, {super.key});

  @override
  createState() => _SettingsWidget();
}

class _SettingsWidget extends State<SettingsWidget>{

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SuggestionNotifier()),
      ],
      builder: (context, child){
        return GestureDetector(
          onTap: () {
            FocusNode? focusNode = FocusManager.instance.primaryFocus;
            if(focusNode != null){
              if(focusNode.hasPrimaryFocus){
                FocusManager.instance.primaryFocus?.unfocus();
                Provider.of<SuggestionNotifier>(context,listen: false).setVisibility(false);
              }
            }
          },
          child: Scaffold(
            drawer: FavoritesMenu(widget.favorites),
            appBar: AppBar(
                backgroundColor: Colors.green,
                actions: [
                  TextButton(
                    onPressed: () {
                      Provider.of<StateManager>(context, listen: false).setCurrentState("MainPage");
                    },
                    child: const Image(
                      image: AssetImage('assets/Marker.svg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ]
            ),
            body: Container(
              alignment: Alignment.topLeft,
              color: Colors.green,
              child: Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ListView(
                  children: [
                    const Text(
                      "Add a favorite address!",
                    ),//for physical keyboard press
                    SearchBar(_controller, true),
                    Container
                      (
                      alignment: Alignment.center,
                      child: const SearchSuggestions(),
                    ),
                    const HighlightWidget(),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}