import 'package:flutter/material.dart';

class RedditScreen extends StatefulWidget {
  const RedditScreen({Key? key}) : super(key: key);

  @override
  _RedditScreenState createState() => _RedditScreenState();
}

class _RedditScreenState extends State<RedditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reddit'),
      ),
      body: Text('Reddit'),
    );
  }
}
