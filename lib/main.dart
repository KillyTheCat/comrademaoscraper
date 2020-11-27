import 'package:flutter/material.dart';
import 'package:comrademaoscraper/pages/choose_novel.dart';
import 'package:comrademaoscraper/pages/readerpage.dart';
import 'package:comrademaoscraper/pages/choosechapterpage.dart';
import 'pages/add_novel.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  final pathToDocs = await getApplicationDocumentsDirectory();
  Hive.init(pathToDocs.path);
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
        '/addnovel': (context) => AddNovel(),
        '/selectchapter': (context) => ChapterSelector(),
      },
    );
  }
}
