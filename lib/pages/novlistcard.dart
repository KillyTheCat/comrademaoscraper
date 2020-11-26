import 'package:flutter/material.dart';
import 'package:comrademaoscraper/elements/novel.dart';

class NovelListCard extends StatelessWidget {
  final Novel novel;
  NovelListCard({this.novel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(12, 12, 12, 0),

      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                
              },
              title: Text('$novel.name'),
            ),
          ],
        )
      ),
    );
  }
}
