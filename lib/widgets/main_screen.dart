import 'package:epicest_project/notifiers/information_notifier.dart';
import 'package:epicest_project/widgets/information_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'search_bar.dart';
import '../notifiers/map_notifier.dart';
import '../notifiers/suggestion_notifier.dart';
import '../utils/information.dart';
import 'map_widget.dart';
import 'search_button_widget.dart';
import 'search_suggestions.dart';

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
                ChangeNotifierProvider(create: (context) => InformationNotifier()),
              ],
              builder: (context, child) {
                return Scaffold(
                  extendBodyBehindAppBar: true,
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    flexibleSpace: Container(
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: SearchBar(textEditingController)
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        )
                    ),
                    elevation: 8,

                    backgroundColor: Colors.red,
                    centerTitle: false,
                    // toolbarHeight: 60,

                    // flexibleSpace: SearchBar(textEditingController),
                    // actions:
                    // [
                    //   SearchButton(textEditingController),
                    //   SearchButton(textEditingController),
                    // ],
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