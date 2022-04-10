import 'dart:convert';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:mixedapp/models/subreddit.dart';
import 'package:mixedapp/services/reddit_card.dart';
import '../api/reddit_api.dart';
import '../keys/keys.dart';

class Posts {
  final String url;
  Posts({required this.url});
}

class RedditSetting extends StatefulWidget {
  const RedditSetting({Key? key}) : super(key: key);

  @override
  _RedditSettingState createState() => _RedditSettingState();
}

class _RedditSettingState extends State<RedditSetting> {
  @override
  Widget build(BuildContext context) {
    var api = new RedditApi();
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Subreddit"),
        backgroundColor: Colors.black,
        centerTitle: true,
        titleSpacing: 2.0,
      ),
      body: FutureBuilder(
          future: api.search('memes'),
          builder:
              (BuildContext context, AsyncSnapshot<List<Subreddit>> snapshot) {
            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData == null) {
              return Center();
            } else if (snapshot.connectionState == ConnectionState.done) {
              //print("astit");
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return RedditCard(snapshot.data![index]);
                },
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
          }),
    );
  }
}
