import 'package:comrademaoscraper/services/webscraper.dart';
import 'package:flutter/material.dart';

class AddNovel extends StatefulWidget {
  @override
  _AddNovelState createState() => _AddNovelState();
}

class _AddNovelState extends State<AddNovel> {

  @override
  Widget build(BuildContext context) {
    Future<String> novelTextGet;
    /* 
    // For BoxNovel
    novelTextGet = getBody(
            siteType: 'boxnovel',
            chapterTitle: 'reverend-insanity',
            chapterNumber: '2075',
          ); 
    */
    // For ComradeMao
    novelTextGet = getBody(
      chapterTitle: 'reverend-insanity',
      chapterNumber: '100',
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          "Add a novel",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: novelTextGet,
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
