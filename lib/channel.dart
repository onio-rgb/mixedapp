class Channel {
  String banner_url;
  String channel_name;
  Channel({required this.banner_url, required this.channel_name});
  Map toJson(int index) => {
        'banner_url$index': banner_url,
        'channel_name$index': channel_name,
      };
  Channel.fromMap(Map data, int index)
      : banner_url = data['banner_url${index}'],
        channel_name = data['channel_name${index}'];
}
