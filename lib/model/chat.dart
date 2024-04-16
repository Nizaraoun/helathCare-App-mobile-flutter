class Chat {
  final String lastmsg;
  final String msg;
  final String? image;
  final String name;

  Chat({
    required this.lastmsg,
    required this.msg,
    this.image,
    required this.name,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      lastmsg: json['lastmsg'],
      msg: json['message'],
      image: json['image'],
      name: json['doctorName'],
    );
  }
}
