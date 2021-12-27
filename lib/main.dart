import 'package:flutter/material.dart';
import './reddit.dart';
import './twitter.dart';
import './youtube.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var list = ['Youtube', 'Reddit', 'Twitter'];
  var index = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget choseScreen() {
    if (_selectedIndex == 0)
      return YoutubeScreen();
    else if (_selectedIndex == 1)
      return RedditScreen();
    else
      return TwitterScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("YTR"),
          backgroundColor: Colors.black87,
          centerTitle: true,
          titleSpacing: 2.0,
        ),
        body: choseScreen(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.youtube_searched_for),
              label: 'Youtube',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Reddit',
              backgroundColor: Colors.orange,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Twitter',
              backgroundColor: Colors.orange,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
