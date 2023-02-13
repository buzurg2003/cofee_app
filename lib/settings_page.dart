import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  static const keyLanguage = 'key-language';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var _toggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: Center(
                child: Image(
                  image: AssetImage(
                    './lib/images/user.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Basic Settings',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 18.5,
                ),
              ),
            ),
            Card(
              color: Colors.white10,
              child: Column(
                children: <Widget> [
                  ListTile(
                    leading: Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                    ),
                    title: Text(
                      'User',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.white10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Language',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Location',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Appearance',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.5,
                ),
              ),
            ),
            Card(
              color: Colors.white10,
              child: Column(
                children: <Widget> [
                  SwitchListTile(
                    title: Text('Theme'),
                    value: _toggled,
                    onChanged: (bool value) {
                      setState(() {
                        _toggled = value;

                        if(value == true) {
                          Text('Dark theme');
                        } else {
                          Text('Light theme');
                        }
                      });
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Change Font',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.white10,
                  ),
                ],
              )
            ),
            Card(
              color: Colors.orange,
              child: Column(
                children: [
                  ListTile(
                    title: Center(
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        context: context, 
                        builder: (context) => AlertDialog(
                        title: Text(
                          'Log Out',
                          style: TextStyle(
                            color: Colors.orange
                          ),
                        ),
                        content: Text('Logged Out'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              }, 
                              child: Text(
                                'Ok',
                                style: TextStyle(
                                  color: Colors.orange
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}