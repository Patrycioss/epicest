import 'package:epicest_project/notifiers/map_notifier.dart';
import 'package:epicest_project/widgets/map_widget.dart';

import 'notifiers/suggestion_notifier.dart';
import 'widgets/search_bar.dart';
import 'widgets/search_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/information.dart';
import 'widgets/search_suggestions.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'TestApp',
      home: Builder(
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

                  flexibleSpace: SearchBar(textEditingController),
                  actions:
                  [
                    SearchButton(textEditingController),
                    SearchButton(textEditingController),
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
                      child:
                        Consumer<SuggestionNotifier>
                        (
                          builder: (context, notifier, child) =>
                            Visibility
                            (
                              visible: Provider.of<SuggestionNotifier>(context, listen: false).visible,
                              child: const SearchSuggestions()
                            ),
                        ),
                    ),
                  ],
                ),
              );
            }
          );
        }
      ),
    );
  }
}