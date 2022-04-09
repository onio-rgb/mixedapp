import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class Posts {
  final String url;
  Posts({required this.url});
}

class RedditScreen extends StatefulWidget {
  const RedditScreen({Key? key}) : super(key: key);

  @override
  _RedditScreenState createState() => _RedditScreenState();
}

class _RedditScreenState extends State<RedditScreen> {
  Future<void> auth() async {
    String myClientId = 'cW7WzeCqurnE8Gvq1mG2Uw';
    String myClientSecret = 'seowNIiknM616dUZ7jKVSK6K_TCy7Q';
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

    print(r.body);
  }

  @override
  Widget build(BuildContext context) {
    auth();
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                foregroundImage: NetworkImage(
                    'https://beebom.com/wp-content/uploads/2020/11/how-to-create-reddit-avatar-feat..jpg?w=750&quality=75'),
              ))
        ],
        title: Text("Reddit"),
        backgroundColor: Colors.black,
        centerTitle: true,
        titleSpacing: 2.0,
      ),
    );
  }
}
