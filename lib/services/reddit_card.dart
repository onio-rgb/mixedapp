import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RedditCard extends StatelessWidget {
  const RedditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 10.0,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(children: [
              
            ]),
          ),
        ),
      ),
    );
  }
}
