import 'package:flutter/material.dart';
import 'package:comrademaoscraper/elements/novel.dart';

//after user chooses the novel from the choose_novel screen, he's led here.

class ChapterSelector extends StatefulWidget {
  @override
  _ChapterSelectorState createState() => _ChapterSelectorState();
}

class _ChapterSelectorState extends State<ChapterSelector> {
  Map noveldata = {
    'title':'Rev. Custer',
    'chapternumber' : '30',
  };

  @override
  Widget build(BuildContext context) {
    noveldata = noveldata.isNotEmpty? noveldata : ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          noveldata['title'],
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text('Current chapter you\'re reading: '),
            SizedBox(height: 30),
            Text(
              noveldata['chapternumber'],
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
