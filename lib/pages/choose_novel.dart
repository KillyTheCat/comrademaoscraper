import 'package:comrademaoscraper/elements/novel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'novlistcard.dart';

class ChooseNovel extends StatefulWidget {
  @override
  _ChooseNovelState createState() => _ChooseNovelState();
}

class _ChooseNovelState extends State<ChooseNovel> {
  // user has to add the novels by himself using floating action button
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
          Navigator.pushNamed(context, '/addnovel');
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.black,
        ),
      ),
      body: Container(),
    );
  }

  Future _buildListView() async {
    final novelsBox = await Hive.openBox('myBooksBox');
    return ListView.builder(
      itemCount: novelsBox.length,
      itemBuilder: (context, index) {
        final novel = novelsBox.get(index) as Novel;

        return NovelListCard(novel: novel);
      },
    );
  }
}
