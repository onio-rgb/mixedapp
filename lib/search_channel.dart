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
  String query = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp),
        ),
        title: Container(
          width: 300,
          child: TextField(
            textCapitalization: TextCapitalization.words,
            enabled: true,
            decoration: InputDecoration(
                prefixIconColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: 'Search Channels..',
                iconColor: Colors.white,
                labelStyle: TextStyle(color: Colors.white)),
            style: TextStyle(
              color: Colors.white,
            ),
            onSubmitted: (value) {
              setState(() {
                query = value;
              });
            },
          ),
          height: 45,
        ),
        centerTitle: true,
      ),
      body: query.isNotEmpty
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.5,
              ),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return FutureBuilder(
                  future: youtubeapi.getChannelList(query),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.none &&
                        snapshot.hasData == null) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return ChannelCard(
                        banner_url: snapshot.data!['items'][index]['snippet']
                            ['thumbnails']['medium']['url'],
                        channel_name: snapshot.data!['items'][index]['snippet']
                            ['title'],
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
                );
              })
          : Container(),
    );
  }
}
