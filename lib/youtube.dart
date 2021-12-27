import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'youtube_card.dart';

class YoutubeScreen extends StatefulWidget {
  const YoutubeScreen({Key? key}) : super(key: key);

  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  final String api = 'AIzaSyABX1HnWsjAWCm5FPcZZr_Ywf14ASofpDI';

  void getData() async {
    Response response =
        await get(Uri.http('jsonplaceholder.typicode.com', '/todos/1'));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Youtube'),
      ),
      body: const YoutubeCard(),
    );
  }
}
