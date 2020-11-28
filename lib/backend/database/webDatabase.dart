import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:comrademaoscraper/backend/database/data/novel.dart';

Future<void> initializeDb() async {
  Hive.initFlutter();
  Hive.registerAdapter<Novel>(NovelAdapter());
}
