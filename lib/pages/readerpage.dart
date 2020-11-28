import 'package:flutter/material.dart';

class ReaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context).settings.arguments;
    final Future<String> demostring = arguments['bodyText'];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          arguments['name'],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
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
