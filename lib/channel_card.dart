import 'package:flutter/material.dart';

class ChannelCard extends StatelessWidget {
  String banner_url;
  String channel_name;
  ChannelCard({required this.banner_url, required this.channel_name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 140,
      color: Colors.transparent,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                foregroundImage: NetworkImage(banner_url),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                channel_name,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
