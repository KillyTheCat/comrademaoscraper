import 'package:flutter/material.dart';

import 'package:comrademaoscraper/backend/database/shared.dart';

import 'package:comrademaoscraper/pages/choose_novel.dart';
import 'package:comrademaoscraper/pages/readerpage.dart';
import 'package:comrademaoscraper/pages/choosechapterpage.dart';
import 'package:comrademaoscraper/pages/add_novel.dart';
import 'package:comrademaoscraper/pages/edit_novel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDb();
  runApp(MyApp());
}

// Every time the user opens the app, he's going to land on the choose novel page

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comrade Mao Unofficial App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: FutureBuilder(
      //   future: Hive.openBox('myBooksBox'),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       if (snapshot.hasError) {
      //         return Text(snapshot.error.toString());
      //       } else {
      //         return ChooseNovel();
      //       }
      //     } else
      //       return Scaffold();
      //   },
      // ),
      initialRoute: '/',
      routes: {
        '/': (context) => ChooseNovel(),
        '/reader': (context) => ReaderPage(),
        '/addnovel': (context) => AddNovel(),
        '/selectchapter': (context) => ChapterSelector(),
        '/editnovel': (context) => EditNovel(),
      },
    );
  }
}
