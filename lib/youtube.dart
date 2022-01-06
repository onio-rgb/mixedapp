import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'youtube_card.dart';
import 'dart:convert';
import 'youtube_api.dart';
import 'package:intl/intl.dart';
import 'globals.dart' as globals;
import 'channel.dart';
import 'package:get_storage/get_storage.dart';

class YoutubeScreen extends StatefulWidget {
  const YoutubeScreen({Key? key}) : super(key: key);

  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  Map<String, dynamic>? body;
  var youtubeapi = new YoutubeApi();
  List temp = [];
  final box = GetStorage('channels_fav');

  void readChannels() {
    globals.channels = [];
    if (box.read('channels') != null) {
      temp = box.read('channels');
      for (int i = 0; i < temp.length; i++) {
        Channel channel = Channel.fromMap(temp[i], i);
        globals.channels.add(channel);
      }
    }
  }

  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    readChannels();
    return Scaffold(
        backgroundColor: Colors.black87,
        body: globals.channels.length != 0
            ? FutureBuilder(
                future: youtubeapi
                    .getLatestVideosList(globals.channels[0].channel_id),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.none &&
                      snapshot.hasData == null) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return YoutubeCard(
                            channel_name: snapshot.data!['items'][index]
                                ['snippet']['channelTitle'],
                            title: snapshot.data!['items'][index]['snippet']
                                ['title'],
                            upload_time: snapshot.data!['items'][index]
                                ['snippet']['publishedAt'],
                            url: snapshot.data!['items'][index]['snippet']
                                ['thumbnails']['high']['url'],
                            views: snapshot.data!['items'][index]['statistics']
                                ['viewCount'],
                            banner_url: snapshot.data!['items'][index]
                                ['banner_url'],
                          );
                        });
                  }
                  return Container(
                    width: double.infinity,
                    height: 305,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.black45,
                      ),
                    ),
                  );
                },
              )
            : Container());
  }
}
// return YoutubeCard(
//               channel_name: body!['items'][0]['snippet']['channelTitle'],
//               title: body!['items'][0]['snippet']['title'],
//               upload_time: body!['items'][0]['snippet']['publishedAt'],
//               url: body!['items'][0]['snippet']['thumbnails']['high']['url'],
//               views: body!['items'][0]['statistics']['viewCount'],
//             );