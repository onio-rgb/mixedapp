import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text("YTR"),
            backgroundColor: Colors.black87,
            centerTitle: true,
            titleSpacing: 2.0,
            leading: Builder(builder: (context) {
              return IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Icon(Icons.menu));
            })),
        drawer: Drawer(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          backgroundColor: Colors.white70,
          elevation: 4.0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Text(
                  "Youtube",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                color: Colors.white70,
              ),
              Card(
                child: Text(
                  "Twitter",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                color: Colors.white70,
              ),
              Card(
                child: Text(
                  "Reddit",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                color: Colors.white70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
