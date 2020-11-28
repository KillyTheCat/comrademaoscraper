import 'package:hive/hive.dart';

part 'novel.g.dart';

@HiveType(typeId: 0)
class Novel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String url;
  @HiveField(2)
  String currentChapter;
  @HiveField(3)
  String source;

  Novel(this.name, this.url, this.currentChapter, this.source);
  // self explanatory, I guess
}
