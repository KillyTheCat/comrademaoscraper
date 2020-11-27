import 'package:flutter/material.dart';
import 'package:comrademaoscraper/services/webscraper.dart';

class Reader extends StatefulWidget {
  @override
  _ReaderState createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {
  Future<String> demostring;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: demostring,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                snapshot.data,
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
