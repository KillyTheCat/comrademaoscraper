import 'package:hive/hive.dart';

// @HiveType()
class Novel {
  // @HiveField(0)
  String name;
  // @HiveField(1)
  String url;
  // @HiveField(2)
  String currentChapter;

  Novel(this.name, this.url, this.currentChapter);
  // self explanatory, I guess
}
