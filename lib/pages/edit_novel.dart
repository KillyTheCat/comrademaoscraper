// import 'package:comrademaoscraper/services/webscraper.dart';
import 'package:flutter/material.dart';

import 'package:comrademaoscraper/backend/database/data/novel.dart';
import 'package:hive/hive.dart';

class EditNovel extends StatefulWidget {
  @override
  _EditNovelState createState() => _EditNovelState();
}

class _EditNovelState extends State<EditNovel> {
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> novel =
        ModalRoute.of(context).settings.arguments;
    final titleController = TextEditingController(text: novel['novel'].name);
    final urlController = TextEditingController(text: novel['novel'].url);
    final positionController =
        TextEditingController(text: novel['novel'].currentChapter);
    final _formKey = GlobalKey<FormState>();
    dropdownValue = novel['novel'].source;
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
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
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
                          return 'Please enter the URL';
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
                          return 'Please enter the chapter number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: StatefulBuilder(
                        builder: (context, setStateDropDown) =>
                            DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black54, fontSize: 25),
                          underline: Container(
                            height: 2,
                            color: Colors.blueAccent,
                          ),
                          onChanged: (String newValue) {
                            setStateDropDown(() {
                              if (newValue.compareTo('choose novel source') !=
                                  0) dropdownValue = newValue;
                            });
                          },
                          items: <String>[
                            "choose novel source",
                            'boxnovel',
                            'comrademao'
                          ].map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Center(
                      child: FlatButton(
                        onPressed: () async {
                          Novel novel1 = new Novel(
                            titleController.text,
                            urlController.text,
                            positionController.text,
                            dropdownValue,
                          );
                          Box<Novel> box =
                              await Hive.openBox<Novel>('myBooksBox');
                          await box.putAt(novel['index'], novel1);
                          await box.close();
                          Function(Novel) rebuildList = novel['updateFunction'];
                          rebuildList(novel1);
                          Navigator.pop(context);
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
      ),
    );
  }
}
