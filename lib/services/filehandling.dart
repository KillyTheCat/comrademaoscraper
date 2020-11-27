import 'package:comrademaoscraper/elements/novel.dart';
import 'package:hive/hive.dart';

void writeToDB(Novel novel) async {
  var box = await Hive.openBox('myBooksBox');
  box.add(novel);
  box.close();
}
