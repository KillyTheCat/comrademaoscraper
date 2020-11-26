import 'package:flutter/material.dart';
import 'package:comrademaoscraper/pages/choose_novel.dart';
import 'package:comrademaoscraper/pages/readerpage.dart';

void main() {
  runApp(MyApp());
}

// Every time the user opens the app, he's going to land on the choose novel page

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comrade Mao unofficial app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ChooseNovel(),
        '/reader': (context) => Reader(),
      },
    );
  }
}

