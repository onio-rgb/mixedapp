import 'package:flutter/material.dart';

class ChannelCard extends StatelessWidget {
  String banner_url;
  String channel_name;
  ChannelCard({required this.banner_url, required this.channel_name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 180,
      color: Colors.transparent,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 10,
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: 90,
                height: 110,
                child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.transparent,
                    foregroundImage: NetworkImage(
                      banner_url,
                    )),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 20,
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
