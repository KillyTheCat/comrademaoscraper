import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:comrademaoscraper/backend/database/data/novel.dart';
import 'package:comrademaoscraper/backend/webscraper.dart';
import 'package:hive/hive.dart';

class ReaderPage extends StatelessWidget {
  void changePageByDelta(
      int delta, BuildContext context, Map<String, dynamic> novelData) {
    Novel novel2 = novelData['novel'];
    final Function(Map<String, dynamic>, String) changeChapter =
        novelData['changeChapterFunction'];

    int changedChapter = int.parse(novel2.currentChapter) + delta;
    novel2.currentChapter = changedChapter.toString();
    novelData['novel'] = novel2;
    Navigator.pushReplacementNamed(
      context,
      '/reader',
      arguments: novelData,
    );
    changeChapter(novelData, novel2.currentChapter);
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> novelData =
        ModalRoute.of(context).settings.arguments;
    Future<String> waitNovelBodyString = scraperFunctions.getBody(
      chapterNumber: novelData['novel'].currentChapter,
      chapterTitle: novelData['novel'].url,
      siteType: novelData['novel'].source,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          novelData['novel'].name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () => changePageByDelta(-1, context, novelData),
            icon: Icon(
              Icons.skip_previous,
              color: Colors.white,
              size: 50,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 12, top: 5),
            child: Text(
              novelData['novel'].currentChapter,
              textAlign: TextAlign.justify,
            ),
          ),
          IconButton(
            onPressed: () => changePageByDelta(1, context, novelData),
            icon: Icon(
              Icons.skip_next,
              color: Colors.white,
              size: 50,
            ),
          ),
          SizedBox(width: 40),
        ],
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (kIsWeb) return;
          if (details.primaryVelocity > 0 &&
              novelData['novel'].currentChapter != 1)
            changePageByDelta(-1, context, novelData);
          else if (details.primaryVelocity < 0)
            changePageByDelta(1, context, novelData);
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          child: NovelBody(novelBodyText: waitNovelBodyString),
        ),
      ),
    );
  }
}

class NovelBody extends StatelessWidget {
  const NovelBody({
    Key key,
    @required this.novelBodyText,
  }) : super(key: key);

  final Future<String> novelBodyText;

  Future<double> getFontSizeFromBox() async {
    Box settingsBox = await Hive.openBox('settingsBox');
    if (!settingsBox.containsKey('fontSize')) {
      return 20;
    } else {
      return settingsBox.get('fontSize');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: novelBodyText,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        String visualizetext = snapshot.data;
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FutureBuilder(
            future: getFontSizeFromBox(),
            initialData: 20.0,
            builder: (context, sizeSnapshot) {
              double desiredSize = sizeSnapshot.data;
              return Text(
                visualizetext,
                style: TextStyle(color: Colors.white, fontSize: desiredSize),
              );
            },
          ),
        );
      },
    );
  }
}
