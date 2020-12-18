import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:comrademaoscraper/backend/database/data/novel.dart';
import 'package:comrademaoscraper/backend/webscraper.dart';

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
    Future<String> demostring = scraperFunctions.getBody(
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
      // drawer: Drawer(
      //   child: Container(
      //     color: Colors.black,
      //     child: Column(
      //       children: <Widget>[
      //         SizedBox(height: 50),
      //         Card(
      //           color: Colors.black,
      //           child: Row(
      //             children: <Widget>[
      //               Expanded(
      //                 flex: 4,
      //                 child: Text(
      //                   'Font Size',
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 30,
      //                     letterSpacing: 1.5,
      //                   ),
      //                 ),
      //               ),
      //               Expanded(
      //                 flex: 1,
      //                 child: IconButton(
      //                   icon: Icon(
      //                     Icons.plus_one,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
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
          child: NovelBody(demostring: demostring),
        ),
      ),
    );
  }
}

class NovelBody extends StatelessWidget {
  const NovelBody({
    Key key,
    @required this.demostring,
  }) : super(key: key);

  final Future<String> demostring;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: demostring,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text(
            snapshot.data,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
