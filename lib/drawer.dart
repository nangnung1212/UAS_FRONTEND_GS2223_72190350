import 'package:flutter/material.dart';
import 'package:uas_frontend_gs2223_72190350/main.dart';

class Pertemuan1 extends StatefulWidget {
  const Pertemuan1({super.key, required this.title});


  final String title;

  @override
  State<Pertemuan1> createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {
  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('POSTS'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('COMMENTS'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('PHOTOS'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('USERS'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}