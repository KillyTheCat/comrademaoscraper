import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:comrademaoscraper/backend/database/data/novel.dart';

import 'package:comrademaoscraper/pages/novlistcard.dart';

class ChooseNovel extends StatefulWidget {
  @override
  _ChooseNovelState createState() => _ChooseNovelState();
}

class _ChooseNovelState extends State<ChooseNovel> {
  Future<Box<Novel>> novelBoxFuture;

  Future<Box<Novel>> _openBooksBox() async {
    final Box<Novel> novelsBox = await Hive.openBox('myBooksBox');
    return novelsBox;
  }

  Future<Box<Novel>> rebuildList() async {
    Box<Novel> box = await _openBooksBox();
    setState(() {});
    return box;
  }

  @override
  void initState() {
    novelBoxFuture = _openBooksBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Choose Novel',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // let user add novels
          Navigator.pushNamed(context, '/addnovel', arguments: rebuildList);
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.black,
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: rebuildList(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CupertinoActivityIndicator(radius: 20),
              );
            if (snapshot.hasError)
              return Text('Unable to Open Books. Database Access error!');

            Box<Novel> novelsBox = snapshot.data;
            if (!novelsBox.isOpen)
              return Center(
                child: CupertinoActivityIndicator(radius: 20),
              );

            return ListView.builder(
              itemCount: novelsBox.length,
              itemBuilder: (context, index) {
                Novel novel = novelsBox.getAt(index);
                return NovelListCard(
                  novel: novel,
                  index: index,
                  deleteNovel: () {
                    setState(
                      () {
                        novelsBox.deleteAt(index);
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
