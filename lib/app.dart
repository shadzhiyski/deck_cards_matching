import 'dart:math';

import 'package:flutter/material.dart';

import 'home_page.dart';
import 'matching/services/items_service.dart';
import 'matching/widgets/game_page.dart';

const String TITLE = 'Deck Cards Matching';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: TITLE,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) {
          return HomePage(title: TITLE);
        },
        '/game': (context) {
          return GamePage(
            itemsService: ItemsService(random: Random()),
          );
        },
      },
    );
  }
}
