import 'package:epicest_project/build_context_storer/build_context_storer.dart';

import '../notifiers/information_notifier.dart';
import '../widgets/information_widget.dart';

import '../widgets/search_bar.dart';
import '../widgets/search_suggestions.dart';
import '../widgets/settings_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../favorites/favorites.dart';
import '../favorites/favorites_menu.dart';
import '../notifiers/map_notifier.dart';
import '../notifiers/suggestion_notifier.dart';
import '../utils/information.dart';
import 'map_widget.dart';

class MainScreen extends StatefulWidget{

  final Favorites favorites;
  const MainScreen(this.favorites, {super.key});

  @override
  createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
{
  @override
  Widget build(BuildContext context) {
    return Builder
    (
        builder: (context)
        {
          Information(MediaQuery.of(context).size);

          final TextEditingController textEditingController = TextEditingController();

          return MultiProvider
          (
            providers:
            [
              ChangeNotifierProvider(create: (context) => SuggestionNotifier()),
              ChangeNotifierProvider(create: (context) => MapNotifier()),
              ChangeNotifierProvider(create: (context) => InformationNotifier()),
            ],
            builder: (context, child)
            {
              BuildContextStorer.mainScreenContext = context;
              return Scaffold
              (
                extendBodyBehindAppBar: true,
                backgroundColor: Colors.transparent,
                drawer:
                  GestureDetector
                  (
                    onTap: () {FocusManager.instance.primaryFocus?.unfocus();},
                    child: FavoritesMenu(widget.favorites)
                  ),
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
                        AppBar
                        (
                          flexibleSpace:
                            Container
                            (
                              margin: const EdgeInsets.fromLTRB(50, 35, 60, 0),
                              child: SearchBar(textEditingController, false)
                            ),

                          shape: const
                            RoundedRectangleBorder
                            (
                              borderRadius: BorderRadius.only
                              (
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              )
                            ),

                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          centerTitle: false,

                          actions:
                            const [
                              SettingsButton(),
                            ],
                        ),
                      ),
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
                        child:
                        Consumer<SuggestionNotifier>
                        (
                          builder: (context, notifier, child) =>
                              Visibility
                              (
                                  visible: Provider.of<SuggestionNotifier>(context, listen: false).visible,
                                  child: const SearchSuggestions(false)
                              ),
                        ),
                      ),
                      Consumer<InformationNotifier>
                      (

                        builder: (context, notifier, child) =>
                          Visibility
                          (
                            visible: notifier.visible,
                            child:
                              Container
                              (
                                alignment: Alignment.bottomCenter,
                                child:
                                  const InformationWidget()
                              ),
                         ),
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