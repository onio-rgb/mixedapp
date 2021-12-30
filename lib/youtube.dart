import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'youtube_card.dart';
import 'dart:convert';

class YoutubeScreen extends StatefulWidget {
  const YoutubeScreen({Key? key}) : super(key: key);

  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  final String api = 'AIzaSyABX1HnWsjAWCm5FPcZZr_Ywf14ASofpDI';
  final _baseUrl = 'www.googleapis.com';
  Map<String, dynamic>? body;

  Future<Map<String, dynamic>?> getVideosList() async {
    Map<String, dynamic> parameters = {
      'part': ['snippet', 'statistics'],
      'id': '9BnLbv6QYcA',
      'key': api,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/videos',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    body = json.decode(response.body);
    return body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Youtube'),
        ),
        body: FutureBuilder(
          future: getVideosList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return YoutubeCard(
              channel_name: body!['items'][0]['snippet']['channelTitle'],
              title: body!['items'][0]['snippet']['title'],
              upload_time: body!['items'][0]['snippet']['publishedAt'],
              url: body!['items'][0]['snippet']['thumbnails']['high']['url'],
              views: body!['items'][0]['statistics']['viewCount'],
            );
          },
        ));
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