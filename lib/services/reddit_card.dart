import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/subreddit.dart';

class RedditCard extends StatelessWidget {
  late Subreddit sub;
  RedditCard(this.sub, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 10.0,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(children: [
              Flexible(
                  child: Image(
                image: NetworkImage(sub.url),
              )),
              Text(sub.name),
              Text(sub.subscribers)
            ]),
          ),
        ),
      ),
    );
  }
}
