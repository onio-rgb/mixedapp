import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mixedapp/search_channel.dart';
import 'channel_card.dart';
import 'youtube_api.dart';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'channel.dart';
import 'globals.dart' as global;

class YoutubeSetting extends StatefulWidget {
  const YoutubeSetting({Key? key}) : super(key: key);
  @override
  _YoutubeSettingState createState() => _YoutubeSettingState();
}

class _YoutubeSettingState extends State<YoutubeSetting> {
  var youtubeapi = new YoutubeApi();
  final box = GetStorage('channels_fav');

  List temp = [];

  // void addChannelFavourite(Channel channel) {
  //   channels.add(channel);
  //   final index = channels.length;
  //   temp.add(channel.toJson(index));
  //   box.write('channels', temp);
  // }

  // void readChannelFavourite() {
  //   if (box.read('channels') == null) return;
  //   temp = box.read('channels');
  //   for (int i = 0; i < temp.length; i++) {
  //     Map map = temp[i];
  //     Channel channel = Channel.fromMap(map, i);
  //     print(channel.banner_url);
  //     global.channels.add(channel);
  //   }
  // }

  // void retreiveChannels() {
  //   if (box.read('channels') == null) return;
  //   temp = box.read('channels');
  //   global.channels = [];
  //   for (int i = 0; i < temp.length; i++) {
  //     Map map = temp[i];
  //     Channel channel = Channel.fromMap(map, i);
  //     print(channel.banner_url);
  //     global.channels.add(channel);
  //   }
  // }

  void initState() {
    super.initState();

    global.channels = [];
    if (box.read('channels') != null) {
      temp = box.read('channels');
      for (int i = 0; i < temp.length; i++) {
        Channel channel = Channel.fromMap(temp[i], i);
        global.channels.add(channel);
      }
    } // restore list from storing in initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
              
              MaterialPageRoute(
                  builder: (BuildContext context) => SearchChannel())).then((_) {
            setState(() {});
          });
        },
      ),
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp),
        ),
        title: Text("Chose Favourite Channels"),
        centerTitle: true,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.5,
          ),
          itemCount: global.channels.length,
          itemBuilder: (BuildContext context, int index) {
            return ChannelCard(
                banner_url: global.channels[index].banner_url,
                channel_name: global.channels[index].channel_name);
          }),
    );
  }
}
