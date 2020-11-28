import 'package:flutter/material.dart';
import 'package:comrademaoscraper/elements/novel.dart';

//after user chooses the novel from the choose_novel screen, he's led here.

class ChapterSelector extends StatefulWidget {
  @override
  _ChapterSelectorState createState() => _ChapterSelectorState();
}

class _ChapterSelectorState extends State<ChapterSelector> {
  Map noveldata;

  @override
  Widget build(BuildContext context) {
    noveldata = noveldata.isNotEmpty
        ? noveldata
        : ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          noveldata['title'],
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
                  color: Colors.white),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  noveldata['chapternumber'],
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
                      onPressed: () {},
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
