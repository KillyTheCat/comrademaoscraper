import 'package:flutter/material.dart';

import 'package:comrademaoscraper/backend/database/data/novel.dart';
import 'package:hive/hive.dart';

//after user chooses the novel from the choose_novel screen, he's led here.

class ChapterSelector extends StatefulWidget {
  @override
  _ChapterSelectorState createState() => _ChapterSelectorState();
}

class _ChapterSelectorState extends State<ChapterSelector> {
  Map<String, dynamic> novelData;

  void updateNovel(Novel changedNovel) {
    setState(
      () {
        novelData['novel'] = changedNovel;
      },
    );
  }

  Future<void> setChapter(
      Map<String, dynamic> novelData, String newChapter) async {
    Box<Novel> box = await Hive.openBox<Novel>('myBooksBox');
    Novel novel2 = novelData['novel'];
    setState(
      () {
        novel2.currentChapter = newChapter;
      },
    );
    await box.putAt(novelData['index'], novel2);
  }

  @override
  Widget build(BuildContext context) {
    novelData = novelData ?? ModalRoute.of(context).settings.arguments;
    novelData['changeChapterFunction'] = setChapter;
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
                        arguments: novelData,
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
                        await setChapter(novelData, '1');
                        Navigator.pushNamed(
                          context,
                          '/reader',
                          arguments: novelData,
                        );
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
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton.icon(
              onPressed: () async {
                // await writeEditedToDB(novelData['novel'], novelData['index']);
                Navigator.pushNamed(
                  context,
                  '/editnovel',
                  arguments: {
                    'novel': novelData['novel'],
                    'index': novelData['index'],
                    'updateFunction': updateNovel,
                  },
                );
              },
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              label: Text(
                'Edit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
