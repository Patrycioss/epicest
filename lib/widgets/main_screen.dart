import 'package:epicest_project/widgets/search_bar.dart';
import 'package:epicest_project/widgets/search_button_widget.dart';
import 'package:epicest_project/widgets/search_suggestions.dart';
import 'package:epicest_project/widgets/settings_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../favorites/favorites_menu.dart';
import '../notifiers/map_notifier.dart';
import '../notifiers/suggestion_notifier.dart';
import '../utils/information.dart';
import 'map_widget.dart';

class MainScreen extends StatefulWidget{

  const MainScreen({super.key});

  @override
  createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen>
{
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {

          Information(MediaQuery.of(context).size);

          final TextEditingController textEditingController = TextEditingController();

          return MultiProvider(
              providers:
              [
                ChangeNotifierProvider(create: (context) => SuggestionNotifier()),
                ChangeNotifierProvider(create: (context) => MapNotifier()),
              ],
              builder: (context, child) {
                return Scaffold(
                  drawer: const FavoritesMenu(),
                  appBar: AppBar(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        )
                    ),
                    elevation: 8,

                    backgroundColor: Colors.green,
                    centerTitle: false,
                    toolbarHeight: 60,

                    flexibleSpace: SearchBar(textEditingController, false),
                    actions:
                    [
                      SearchButton(textEditingController),
                      const SettingsButton(),
                    ],
                  ),
                  body:
                  Stack
                    (
                    children:
                    [
                      const InAppMap(),
                      Container
                        (
                        alignment: Alignment.center,
                        child: const SearchSuggestions(),
                      ),
                    ],
                  ),
                );
              }
          );
        }
    );
  }

}