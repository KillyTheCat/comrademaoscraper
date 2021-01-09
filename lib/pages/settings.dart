import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future<Box<num>> settingsBoxFuture;
  num currentSize;

  void initBox() async {
    Box<num> settingsBox = await settingsBoxFuture;
    if (!settingsBox.containsKey('fontSize')) settingsBox.put('fontSize', 20);
    if (!settingsBox.containsKey('darkModeActive'))
      settingsBox.put('darkModeActive', 1);

    setState(() => currentSize = settingsBox.get('fontSize'));
  }

  @override
  void initState() {
    settingsBoxFuture = Hive.openBox<num>('settingsBox');
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
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          settingsBox.get('fontSize') - 1,
                        );
                        setState(
                          () => currentSize = settingsBox.get('fontSize'),
                        );
                      },
                      icon: Icon(Icons.exposure_minus_1),
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
                          settingsBox.get('fontSize') + 1,
                        );
                        setState(
                          () => currentSize = settingsBox.get('fontSize'),
                        );
                      },
                      icon: Icon(Icons.plus_one),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Text(
                      "Dark Mode",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Switch(
                      value: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          FlatButton(
            height: 100,
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationVersion: '0.0.5',
                applicationName: 'Comrademaoscraper: your novel reader',
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
          ),
        ],
      ),
    );
  }
}
