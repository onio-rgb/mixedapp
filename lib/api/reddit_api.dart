import 'dart:_http';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class RedditApi {
  Future<void> auth() async {
    Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };
    Response r = await http.post(
        Uri.parse('https://www.reddit.com/api/v1/access_token'),
        body: {'grant_type': 'client_credentials'});

    print(r.body);
  }
}
