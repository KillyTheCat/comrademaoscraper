import 'package:flutter/material.dart';

class Add_novel extends StatefulWidget {
  @override
  _Add_novelState createState() => _Add_novelState();
}

class _Add_novelState extends State<Add_novel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add a novel",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
