import 'package:flutter/material.dart';
import 'channel_card.dart';
import 'youtube_api.dart';

class YoutubeSetting extends StatefulWidget {
  const YoutubeSetting({Key? key}) : super(key: key);

  @override
  _YoutubeSettingState createState() => _YoutubeSettingState();
}

class _YoutubeSettingState extends State<YoutubeSetting> {
  var youtubeapi = new YoutubeApi();
  String query = 'The Onion';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp),
        ),
        title: Text("Chose Favourite Channels"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: youtubeapi.getChannelList(query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.hasData == null) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            return ChannelCard(
              banner_url: snapshot.data!['items'][0]['snippet']['thumbnails']
                  ['default']['url'],
              channel_name: snapshot.data!['items'][0]['snippet']['title'],
            );
          }
          return Container(
            width: 100,
            height: 140,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.black45,
              ),
            ),
          );
        },
      ),
    );
  }
}
