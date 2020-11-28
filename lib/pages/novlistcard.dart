import 'package:flutter/material.dart';

import 'package:comrademaoscraper/backend/database/data/novel.dart';

class NovelListCard extends StatelessWidget {
  final Novel novel;
  NovelListCard({this.novel});
  // the card that I wanna display on the choose novel screen.
  // plan to add cover images and author names too.

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ListTile(
            onTap: () {
              // send to a page where the user can choose the chapter, I have yet to make it.
              Navigator.pushNamed(context, '/selectchapter', arguments: novel);
            },
            title: Text('${novel.name}'),
          )),
    );
  }
}
