import 'package:hive/hive.dart';

import 'package:comrademaoscraper/backend/database/data/novel.dart';

Future<void> writeToDB(Novel novel) async {
  Box<Novel> box = await Hive.openBox<Novel>('myBooksBox');
  box.add(novel);
  box.close();
}

Future<void> writeEditedToDB(Novel novelName, int index) async {
  Box<Novel> box = await Hive.openBox<Novel>('myBooksBox');
  box.putAt(index, novelName);
  box.close();
}
