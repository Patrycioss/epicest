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
            appBar:
              AppBar
              (
                flexibleSpace:
                 Container
                 (
                   decoration:
                     const BoxDecoration
                       (
                         gradient:
                         LinearGradient
                           (
                             begin: Alignment.topRight,
                             end: Alignment.bottomLeft,
                             colors:
                             [
                               Color(0xFFA0CFEC),
                               Color(0xFF71C6C9),
                               Color(0xFF57B2B7)
                             ]
                         )
                     ),
                   child:
                     AppBar(
                         backgroundColor: Colors.transparent,
                         elevation: 0,
                         actions: [
                           TextButton(
                             onPressed: () {
                               Provider.of<StateManager>(context, listen: false).setCurrentState("MainPage");
                             },
                             child: const Image(
                               image: AssetImage('assets/mapIcon.png'),
                               fit: BoxFit.cover,
                             ),
                           ),
                         ]
                     ),
                 ),
              ),
            body: Container(
              alignment: Alignment.topLeft,
              decoration:
              const BoxDecoration
                (
                  gradient:
                  LinearGradient
                    (
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors:
                      [
                        Color(0xFFA0CFEC),
                        Color(0xFF71C6C9),
                        Color(0xFF57B2B7)
                      ]
                  )
              ),
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        const Text("Add a favorite address!"),//for physical keyboard press
                        SearchBar(_controller, true),
                      ],
                    ),
                    Container
                    (
                      alignment: Alignment.center,
                      child: const SearchSuggestions(true),
                    ),
                    Container
                    (
                      child: Column(
                        children: const [
                          HighlightWidget(),
                        ],
                      ),
                    )
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