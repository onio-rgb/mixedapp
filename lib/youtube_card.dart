import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class YoutubeCard extends StatelessWidget {
  final String title;
  final String url;
  final String channel_name;
  final String views;
  final String upload_time;
  final String banner_url;

  YoutubeCard(
      {required this.channel_name,
      required this.title,
      required this.upload_time,
      required this.url,
      required this.views,
      required this.banner_url});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: 305,
      child: Card(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        elevation: 10,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(url),
                )),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  // Container(
                  //   width: 50,
                  //   height: 50,
                  //   color: Colors.red,
                  // ),
                  Container(
                    height: 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundImage: NetworkImage(banner_url),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: double.infinity,
                    width: 306,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Text(
                            title,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  channel_name,
                                  style: const TextStyle(
                                      leadingDistribution:
                                          TextLeadingDistribution.even,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 10),
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                child: Text(
                                  '$views views',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 10),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                child: Text(
                                  upload_time,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: Container(
                      height: double.infinity,
                      width: 20,
                      child: Icon(
                        Icons.more_vert_outlined,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
