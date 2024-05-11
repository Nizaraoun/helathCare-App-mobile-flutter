class Chat {
  final String lastmsg;
  final String msg;
  final String? image;
  final String name;
  final String? id;
  final String? doctorId;

  Chat({
    this.id,
    this.doctorId,
    required this.lastmsg,
    required this.msg,
    this.image,
    required this.name,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      lastmsg: json['lastmsg'],
      id: json['conversationId'],
      msg: json['message'],
      image: json['image'],
      name: json['doctorName'],
      doctorId: json['doctorId'],
    );
  }
}
