import 'package:flutter/material.dart';
import 'package:mixedapp/keys/keys.dart';
import 'package:mixedapp/services/reddit_auth_loading.dart';
import 'package:mixedapp/settings/reddit_settings.dart';

class RedditScreen extends StatefulWidget {
  const RedditScreen({Key? key}) : super(key: key);

  @override
  State<RedditScreen> createState() => _RedditScreenState();
}

class _RedditScreenState extends State<RedditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext cxt) => RedditSetting()))
                  .then((_) {
                setState(() {});
              });
              ;
            },
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
      body: ((isauth == false)
          ? AuthLoadReddit()
          : Center(child: Text("Authorized"))),
    );
  }
}
