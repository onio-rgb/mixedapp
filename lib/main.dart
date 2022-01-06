import 'package:flutter/material.dart';
import './reddit.dart';
import './twitter.dart';
import './youtube.dart';
import 'package:http/http.dart' as http;
import 'search_channel.dart';
import 'youtube_setting.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  
  runApp(MaterialApp(
    home: MyApp(),
  ));
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
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              if (_selectedIndex == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext cxt) => YoutubeSetting())).then((_) {
            
            setState(() {});
          });;
              }
            },
          )
        ],
        title: Text(list[_selectedIndex]),
        backgroundColor: Colors.black,
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
    );
  }
}
