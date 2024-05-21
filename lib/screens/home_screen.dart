import 'dart:io';

import 'package:bank_app_mockup/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.png'),
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome back, User!',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 20),
            const Card(
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Account Balance:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.account_balance_wallet),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$10,000',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wb_sunny, // Sun icon
                  color:
                      _isDarkModeEnabled == false ? Colors.orange : Colors.grey,
                ),
                Switch.adaptive(
                  value: _isDarkModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isDarkModeEnabled = value;
                      MyApp.of(context).changeTheme(
                          value ? ThemeMode.dark : ThemeMode.light);
                    });
                  },
                ),
                Icon(
                  Icons.nightlight_round, // Moon icon
                  color:
                      _isDarkModeEnabled == true ? Colors.indigo : Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAdaptiveDialog(
            context,
            title: const Text('Dialog Box'),
            content: const Text('This is a dialog box.'),
            actions: <Widget>[
              TextButton(
                child:
                    const Text('Cancel', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
        tooltip: 'Open Dialog',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAdaptiveDialog(
    context, {
    required Text title,
    required Text content,
    required List<Widget> actions,
  }) {
    Platform.isIOS || Platform.isMacOS
        ? showCupertinoDialog<String>(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              title: title,
              content: content,
              actions: actions,
            ),
          )
        : showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: title,
              content: content,
              actions: actions,
            ),
          );
  }
}
