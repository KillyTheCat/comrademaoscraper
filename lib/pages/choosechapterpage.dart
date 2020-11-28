import 'package:flutter/material.dart';

import 'package:comrademaoscraper/backend/database/data/novel.dart';
import 'package:comrademaoscraper/backend/webscraper.dart';

//after user chooses the novel from the choose_novel screen, he's led here.

class ChapterSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Novel novelData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          novelData.name,
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
                  novelData.currentChapter,
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
                            chapterNumber: novelData.currentChapter,
                            chapterTitle: novelData.url,
                            siteType: novelData.source,
                          ),
                          'name': novelData.name,
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
                      onPressed: () {},
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
