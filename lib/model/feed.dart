class Feed {
  final int? postId;
  final String? userId;
  final String? content;
  final int? commentcount;
  final String? createdAt;
  final String? userRole;
  final String? userImage;
  final String? userName;
  final int? commentId;
  final bool? anonymous;

  Feed({
    this.postId,
    this.userId,
    this.content,
    this.commentcount,
    this.createdAt,
    this.userRole,
    this.userImage,
    this.userName,
    this.commentId,
    this.anonymous,
  });

  factory Feed.fromJson(Map<String?, dynamic> json) {
    return Feed(
      postId: json['postId'] ?? 0,
      userId: json['userId'] ?? 'No user',
      content: json['content'] ?? 'No content',
      commentcount: json['commentCount'] ?? 0,
      createdAt: json['createdAt'] ?? '2021-09-01T00:00:00.000Z',
      userRole: json['role'] ?? 'user',
      userImage: json['senderImg'] ?? 'No image',
      userName: json['senderName'] ?? 'مجهول الاسم',
      commentId: json['commentId'] ?? 0,
      anonymous: json['anonymous'] ?? false,
    );
  }
}
