class Channel {
  String banner_url;
  String channel_name;
  String channel_id;
  Channel({required this.banner_url, required this.channel_name,required this.channel_id});
  Map toJson(int index) => {
        'channel_id$index': channel_id,
        'banner_url$index': banner_url,
        'channel_name$index': channel_name,
      };
  Channel.fromMap(Map data, int index)
      : banner_url = data['banner_url${index}'],
        channel_name = data['channel_name${index}'],
        channel_id = data['channel_id${index}'];
}
