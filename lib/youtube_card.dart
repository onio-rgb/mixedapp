import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class YoutubeCard extends StatelessWidget {
  final String title;
  final String url;
  final String channel_name;
  final String views;
  final String upload_time;

  YoutubeCard(
      {required this.channel_name,
      required this.title,
      required this.upload_time,
      required this.url,
      required this.views});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 10,
        child: Container(
          color: Colors.black87,
          width: double.infinity,
          height: 305,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Image.network(
                    url,
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
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
                            flex: 2,
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
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    channel_name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w200,
                                        fontSize: 10),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    views,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w200,
                                        fontSize: 10),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
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
      ),
    );
  }
}
