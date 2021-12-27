import 'package:flutter/material.dart';

class TwitterScreen extends StatefulWidget {
  const TwitterScreen({Key? key}) : super(key: key);

  @override
  _TwitterScreenState createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter'),
      ),
      body: Text("Twitter"),
    );
  }
}
