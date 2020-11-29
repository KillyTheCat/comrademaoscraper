import 'package:flutter/material.dart';

import 'package:comrademaoscraper/backend/database/data/novel.dart';
import 'package:comrademaoscraper/backend/webscraper.dart';
import 'package:hive/hive.dart';

//after user chooses the novel from the choose_novel screen, he's led here.

class ChapterSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map novelData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          novelData['novel'].name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Current chapter you\'re reading: ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  novelData['novel'].currentChapter,
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/reader',
                        arguments: {
                          'bodyText': scraperFunctions.getBody(
                            chapterNumber: novelData['novel'].currentChapter,
                            chapterTitle: novelData['novel'].url,
                            siteType: novelData['novel'].source,
                          ),
                          'name': novelData['novel'].name,
                        },
                      ),
                      child: Text(
                        'Continue Reading',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FlatButton(
                      onPressed: () async {
                        Novel novel2 = novelData['novel'];
                        novel2.currentChapter = '1';
                        Box<Novel> box =
                            await Hive.openBox<Novel>('myBooksBox');
                        box.putAt(novelData['index'], novel2);
                        Navigator.pushReplacementNamed(context, '/selectchapter',
                      arguments: {
                        'novel' : novelData['novel'],
                        'index' : novelData['index'],
                      });
                      },
                      child: Text(
                        'Go to beginning',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
