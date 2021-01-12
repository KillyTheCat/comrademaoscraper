import 'dart:io';

import 'package:sqflite/sqflite.dart' show getDatabasesPath;
import 'package:hive/hive.dart';

import 'package:comrademaoscraper/backend/database/data/novel.dart';
import 'package:path_provider/path_provider.dart' as paths;

Future<void> initializeDb() async {
  if (Platform.isIOS || Platform.isAndroid) {
    final documentDirectory = await paths.getApplicationDocumentsDirectory();
    Hive.init(documentDirectory.path);
  } else if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
    final documentDirectory = await getDatabasesPath();
    Hive.init(documentDirectory);
  }
  Hive.registerAdapter<Novel>(NovelAdapter());
}
