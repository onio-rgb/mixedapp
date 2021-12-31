import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class YoutubeApi {
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };
  final String api = 'AIzaSyABX1HnWsjAWCm5FPcZZr_Ywf14ASofpDI';
  final _baseUrl = 'www.googleapis.com';
  Future<Map<String, dynamic>> getVideosList(List<String> videoId) async {
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
      'part': 'brandingSettings',
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
    return body['items'][0]["brandingSettings"]["image"]["bannerExternalUrl"];
  }
}
