import 'package:flutter/material.dart';

class YoutubeSetting extends StatefulWidget {
  const YoutubeSetting({Key? key}) : super(key: key);

  @override
  _YoutubeSettingState createState() => _YoutubeSettingState();
}

class _YoutubeSettingState extends State<YoutubeSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp),
        ),
        title: Text("Chose Favourite Channels"),
        centerTitle: true,
      ),
      body: Text("YoutubeSetting"),
    );
  }
}
