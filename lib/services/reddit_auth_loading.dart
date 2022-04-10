import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../keys/keys.dart';

class AuthLoadReddit extends StatelessWidget {
  AuthLoadReddit({Key? key}) : super(key: key);

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
    print('First$accessToken');
  }

  Future<void> refresh() async {
    if (isauth == false) {
      await auth();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: auth(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          return Center();
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Container();
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
  }
}
