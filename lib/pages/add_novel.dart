// import 'package:comrademaoscraper/services/webscraper.dart';
import 'package:flutter/material.dart';
import 'package:comrademaoscraper/elements/novel.dart';

class AddNovel extends StatefulWidget {
  @override
  _AddNovelState createState() => _AddNovelState();
}

class _AddNovelState extends State<AddNovel> {
  @override
  Widget build(BuildContext context) {
    // Future<String> novelTextGet;
    // For BoxNovel
    // novelTextGet = scraperFunctions.getBody(
    //   siteType: 'boxnovel',
    //   chapterTitle: 'reverend-insanity',
    //   chapterNumber: '2075',
    // );
    /*
    // For BoxNovel
    novelTextGet = scraperFunctions.getBody(
      siteType: 'boxnovel',
      chapterTitle: 'reverend-insanity',
      chapterNumber: '100',
    );
    */
    /* 
    // For ComradeMao
    novelTextGet = scraperFunctions.getBody(
      siteType: 'comrademao',
      chapterTitle: 'great-emperor-myriad',
      chapterNumber: '3475',
    );
    */

    final titleController = TextEditingController();
    final urlController = TextEditingController();
    final positionController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
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
      // body: Container(
      //   margin: const EdgeInsets.all(10),
      //   child: FutureBuilder(
      //     future: novelTextGet,
      //     builder: (context, snapshot) {
      //       if (!snapshot.hasData)
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       return SingleChildScrollView(
      //         scrollDirection: Axis.vertical,
      //         child: Text(
      //           snapshot.data,
      //           style: TextStyle(color: Colors.white),
      //         ),
      //       );
      //     },
      //   ),
      // ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.white70,
                        ),
                      ),
                      fillColor: Colors.white70,
                      labelText: 'Enter Novel Title',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter the title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: urlController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.white70,
                        ),
                      ),
                      fillColor: Colors.white70,
                      labelText: 'Enter Novel name as seen in URL',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter the URL';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: positionController,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.white70,
                        ),
                      ),
                      fillColor: Colors.white70,
                      labelText:
                          'Enter the chapter number you were on last time',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter the chapter number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: FlatButton(
                      onPressed: () {
                        Novel novel = new Novel(titleController.text,
                            urlController.text, positionController.text);
                        print(novel.currentChapter);
                      },
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
