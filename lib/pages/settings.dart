import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future<Box> settingsBoxFuture;
  double currentSize;

  void initBox() async {
    Box settingsBox = await settingsBoxFuture;
    if (!settingsBox.containsKey('fontSize')) settingsBox.put('fontSize', 20);
    setState(() => currentSize = settingsBox.get('fontSize'));
  }

  @override
  void initState() {
    settingsBoxFuture = Hive.openBox('settingsBox');
    initBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: Text('Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Font Size",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () async {
                        Box settingsBox = await settingsBoxFuture;
                        settingsBox.put(
                          'fontSize',
                          settingsBox.get('fontSize') + 1,
                        );
                        setState(
                          () => currentSize = settingsBox.get('fontSize'),
                        );
                      },
                      icon: Icon(Icons.plus_one),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(child: Text('$currentSize')),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () async {
                        Box settingsBox = await settingsBoxFuture;
                        settingsBox.put(
                          'fontSize',
                          settingsBox.get('fontSize') - 1,
                        );
                        setState(
                          () => currentSize = settingsBox.get('fontSize'),
                        );
                      },
                      icon: Icon(Icons.exposure_minus_1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationVersion: '0.0.5',
                applicationName: 'Dokusha: your novel reader',
              );
            },
            child: Text(
              'About App',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
