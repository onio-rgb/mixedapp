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
        body: choseScreen(),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.grey,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.white,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.white))),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.youtube_searched_for,
                ),
                label: 'Youtube',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.business,
                ),
                label: 'Reddit',
                backgroundColor: Colors.orange,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Twitter',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            onTap: _onItemTapped,
          ),
        ));
  }
}
