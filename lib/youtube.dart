import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'youtube_card.dart';
import 'dart:convert';
import 'youtube_api.dart';
import 'package:intl/intl.dart';

class YoutubeScreen extends StatefulWidget {
  const YoutubeScreen({Key? key}) : super(key: key);

  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  Map<String, dynamic>? body;
  var youtubeapi = new YoutubeApi();
  List<String> videoId = ['cQwqeaFABG8', 'UceaB4D0jpo', 'OMaxB6lKSUU'];
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: ListView.builder(
            itemCount: videoId.length,
            itemBuilder: (BuildContext context, int index) {
              return FutureBuilder(
                future: youtubeapi.getVideosList(videoId),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.none &&
                      snapshot.hasData == null) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return YoutubeCard(
                      channel_name: snapshot.data!['items'][index]['snippet']
                          ['channelTitle'],
                      title: snapshot.data!['items'][index]['snippet']['title'],
                      upload_time: snapshot.data!['items'][index]['snippet']
                          ['publishedAt'],
                      url: snapshot.data!['items'][index]['snippet']
                          ['thumbnails']['high']['url'],
                      views: snapshot.data!['items'][index]['statistics']
                          ['viewCount'],
                      banner_url: snapshot.data!['items'][index]['banner_url'],
                    );
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
              );
            }));
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
// return YoutubeCard(
//               channel_name: body!['items'][0]['snippet']['channelTitle'],
//               title: body!['items'][0]['snippet']['title'],
//               upload_time: body!['items'][0]['snippet']['publishedAt'],
//               url: body!['items'][0]['snippet']['thumbnails']['high']['url'],
//               views: body!['items'][0]['statistics']['viewCount'],
//             );