import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'channel_card.dart';
import 'youtube_api.dart';
import 'channel.dart';
import 'package:get_storage/get_storage.dart';
import 'globals.dart' as global;

class SearchChannel extends StatefulWidget {
  const SearchChannel({Key? key}) : super(key: key);

  @override
  _SearchChannelState createState() => _SearchChannelState();
}

class _SearchChannelState extends State<SearchChannel> {
  var youtubeapi = new YoutubeApi();
  String query = "";
  final box = GetStorage('channels_fav');
  List temp = [];

  // void addChannelFavourite(Channel channel) {
  //   global.channels.add(channel);
  //   final index = global.channels.length;
  //   temp.add(channel.toJson(index));
  //   box.write('channels', temp);
  // }

  // void readChannelFavourite() {
  //   if (box.read('channels') == null) return;
  //   temp = box.read('channels');
  //   for (int i = 0; i < temp.length; i++) {
  //     final Map map = temp[i];
  //     Channel channel = Channel.fromMap(map, i);
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
  //     print(channel.channel_name);
  //     global.channels.add(channel);
  //   }
  // }
  void addChannelFavourite(Channel channel) {
    temp.add(channel.toJson(temp.length));
    box.erase();
    box.write('channels', temp);
  }

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
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp),
        ),
        title: Container(
          width: 300,
          child: TextField(
            textCapitalization: TextCapitalization.words,
            enabled: true,
            decoration: InputDecoration(
                prefixIconColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: 'Search Channels..',
                iconColor: Colors.white,
                labelStyle: TextStyle(color: Colors.white)),
            style: TextStyle(
              color: Colors.white,
            ),
            onSubmitted: (value) {
              setState(() {
                query = value;
              });
            },
          ),
          height: 45,
        ),
        centerTitle: true,
      ),
      body: query.isNotEmpty
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.5,
              ),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return FutureBuilder(
                  future: youtubeapi.getChannelList(query),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.none &&
                        snapshot.hasData == null) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return InkWell(
                        onTap: () {
                          Channel tempChannel = Channel(
                            channel_id: snapshot.data!['items'][index]['id']['channelId'],
                              banner_url: snapshot.data!['items'][index]
                                  ['snippet']['thumbnails']['medium']['url'],
                              channel_name: snapshot.data!['items'][index]
                                  ['snippet']['title']);
                          addChannelFavourite(tempChannel);
                          Navigator.pop(context);
                        },
                        child: ChannelCard(
                          banner_url: snapshot.data!['items'][index]['snippet']
                              ['thumbnails']['medium']['url'],
                          channel_name: snapshot.data!['items'][index]
                              ['snippet']['title'],
                        ),
                      );
                    }
                    return Container(
                      width: 100,
                      height: 140,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.black45,
                        ),
                      ),
                    );
                  },
                );
              })
          : Container(),
    );
  }
}
