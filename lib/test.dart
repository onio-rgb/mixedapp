ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return FutureBuilder(
                    future: youtubeapi
                        .getLatestVideosList(globals.channels[0].channel_id),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.none &&
                          snapshot.hasData == null) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return YoutubeCard(
                          channel_name: snapshot.data!['items'][index]
                              ['snippet']['channelTitle'],
                          title: snapshot.data!['items'][index]['snippet']
                              ['title'],
                          upload_time: snapshot.data!['items'][index]['snippet']
                              ['publishedAt'],
                          url: snapshot.data!['items'][index]['snippet']
                              ['thumbnails']['high']['url'],
                          views: snapshot.data!['items'][index]['statistics']
                              ['viewCount'],
                          banner_url: snapshot.data!['items'][index]
                              ['banner_url'],
                        );
                      }
                      return Container(
                        width: double.infinity,
                        height: 305,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.black45,
                          ),
                        ),
                      );
                    },
                  );
                })