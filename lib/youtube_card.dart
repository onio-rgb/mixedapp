import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class YoutubeCard extends StatelessWidget {
  const YoutubeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 10,
        child: Container(
          color: Colors.black87,
          width: double.infinity,
          height: 290,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Image.network(
                    "https://i.ytimg.com/vi/7lCDEYXw3mM/hqdefault.jpg",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: <Widget>[
                        const Text(
                          "I took a picture of horsehead Nubula",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Channel name",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Views",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Upload time",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 15),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
