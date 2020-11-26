import 'package:flutter/material.dart';

class ChooseNovel extends StatefulWidget {
  @override
  _ChooseNovelState createState() => _ChooseNovelState();
}

class _ChooseNovelState extends State<ChooseNovel> {
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
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          
        ],
      )
    );
  }
}
