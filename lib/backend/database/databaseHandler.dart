import 'package:hive/hive.dart';

import 'package:comrademaoscraper/backend/database/data/novel.dart';

Future<void> writeToDB(Novel novel) async {
  Box<Novel> box = await Hive.openBox<Novel>('myBooksBox');
  box.add(novel);
  box.close();
}

Future<void> incrementChapterNumber(String novelName) async {
  Box<Novel> box = await Hive.openBox<Novel>('myBooksBox');
  // increment chapter number of the novel
  box.close();
}
