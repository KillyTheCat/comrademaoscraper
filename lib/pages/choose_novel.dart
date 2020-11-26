import 'package:flutter/material.dart';

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
        body: ListView(
          padding: EdgeInsets.all(8),
          children: [
            // check novlistcard.dart to see the widget.
            // planning to have a widget for each novel the user has
          ],
        ));
  }
}
