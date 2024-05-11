class Message {
  final String sender;
  final String body;

  Message({required this.sender, required this.body});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      sender: json['sender'],
      body: json['body'],
    );
  }
}
