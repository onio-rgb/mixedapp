import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import '../keys/keys.dart';
import '../models/subreddit.dart';

class RedditApi {
  Map<String, String> headers = {
    'User-Agent': 'MyAPI/0.0.1',
    'Authorization': 'bearer $accessToken'
  };
  final _baseUrl = 'oauth.reddit.com';
  Future<void> auth() async {
    Map<String, String> header = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization':
          'Basic ${base64.encode(utf8.encode('$myClientId:$myClientSecret'))}',
    };
    Response r =
        await http.post(Uri.parse('https://www.reddit.com/api/v1/access_token'),
            body: {
              'grant_type': "client_credentials",
            },
            headers: header);
    Map<String, dynamic> body = json.decode(r.body);
    accessToken = body['access_token'];
    isauth = true;
    print('Astitva$accessToken');
  }

  Future<void> refresh() async {
    if (isauth == false) {
      await auth();
    }
  }

  Future<List<Subreddit>> search(String q) async {
    await refresh();
    Map<String, String> parameters = {'q': q, 'type': 'sr'};
    Uri uri = Uri.https(
      _baseUrl,
      '/search',
      parameters,
    );
    print(headers);
    Response response = await http.get(uri, headers: headers);
    Map<String, dynamic> body = json.decode(response.body);
    List<Subreddit> subs = [];

    for (int i = 0; i < body['data']['children'].length; i++) {
      log(body['data']['children'][i]['data']['icon_img']);
      log(body['data']['children'][i]['data']['display_name_prefixed']);
      log(body['data']['children'][i]['data']['subscribers'].toString());
      subs.add(Subreddit(
          body['data']['children'][i]['data']['icon_img'],
          body['data']['children'][i]['data']['display_name_prefixed'],
          body['data']['children'][i]['data']['subscribers'].toString()));
    }
    // print(subs.length);
    //print('ASTITVA${subs.length}');
    return subs;
  }
}
