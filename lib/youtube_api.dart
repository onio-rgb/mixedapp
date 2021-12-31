import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class YoutubeApi {
  
  final String api = 'AIzaSyABX1HnWsjAWCm5FPcZZr_Ywf14ASofpDI';
  final _baseUrl = 'www.googleapis.com';
  Future<Map<String, dynamic>> getVideosList(List<String> videoId) async {
    Map<String, dynamic> parameters = {
      'part': ['snippet', 'statistics'],
      'id': videoId,
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
    Map<String, dynamic> body = json.decode(response.body);
    return body;
  }
}
