import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'globals.dart' as global;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'channel.dart';

class YoutubeApi {
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  final String api = global.apikeys['puru.verma.aasec@gmail.com'] as String;
  final _baseUrl = 'www.googleapis.com';

  Future<Map<String, dynamic>> getVideo(List<String> videoId) async {
    Map<String, dynamic> parameters = {
      'part': ['snippet', 'statistics'],
      'id': videoId,
      'key': api,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/videos',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    Map<String, dynamic> body = json.decode(response.body);
    for (int index = 0; index < videoId.length; index++) {
      body['items'][index]['banner_url'] =
          await getChannelBanner(body['items'][index]['snippet']['channelId']);
    }
    return body;
  }

  Future<String> getChannelBanner(String channelId) async {
    Map<String, dynamic> parameters = {
      'part': 'snippet',
      'id': channelId,
      'key': api,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    Map<String, dynamic> body = json.decode(response.body);
    return body['items'][0]["snippet"]["thumbnails"]["default"]['url'];
  }

  Future<Map<String, dynamic>> getChannelList(String query) async {
    Map<String, dynamic> parameters = {
      'part': 'snippet',
      'q': query,
      'type': 'channel',
      'maxResults': '5',
      'key': api,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/search',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    Map<String, dynamic> body = json.decode(response.body);
    return body;
  }

  Future<List<String>> getLatestVideosListPerChannel(String channelId) async {
    Map<String, dynamic> parameters = {
      'part': 'snippet',
      'channelId': channelId,
      'type': 'video',
      'maxResults': '4',
      'order': 'date',
      'key': api,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/search',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    Map<String, dynamic> body = json.decode(response.body);
    List<String> videoIds = [];
    for (var i in body['items']) {
      videoIds.add(i['id']['videoId']);
    }
    // Map<String, dynamic> latestVideosPerChannel = await getVideo(videoIds);
    return videoIds;
  }

  Future<Map<String, dynamic>> getLatestVideosList(
      List<Channel> channels) async {
    List<String> videoIds = [];
    List<String> temp = [];
    for (int i = 0; i < channels.length; i++) {
      temp = await getLatestVideosListPerChannel(channels[i].channel_id);
      videoIds.addAll(temp);
    }
    videoIds.shuffle();
    videoIds.shuffle();
    Map<String, dynamic> latestVideos = await getVideo(videoIds);
    return latestVideos;
  }
}
