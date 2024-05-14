class Commenter {
  final int? postId;
  final String? userId;
  final String? content;
  final String? createdAt;
  final String? userImage;
  final String? userName;

  Commenter({
    this.postId,
    this.userId,
    this.content,
    this.createdAt,
    this.userImage,
    this.userName,
  });

  factory Commenter.fromJson(Map<String?, dynamic> json) {
    return Commenter(
      postId: json['postId'] ?? 0,
      userId: json['userId'] ?? 'No user',
      content: json['content'] ?? 'No content',
      createdAt: json['createdAt'] ?? '2021-09-01T00:00:00.000Z',
      userImage: json['senderImg'] ?? 'No image',
      userName: json['senderName'] ?? 'مجهول الاسم',
    );
  }
}
