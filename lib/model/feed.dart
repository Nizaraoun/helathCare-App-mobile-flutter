class Feed {
  final String? postId;
  final String? userId;
  final String? content;
  final int? commentcount;
  final String? createdAt;
  final String? userRole;

  Feed({
    this.postId,
    this.userId,
    this.content,
    this.commentcount,
    this.createdAt,
    this.userRole,
  });

  factory Feed.fromJson(Map<String?, dynamic> json) {
    return Feed(
      postId: json['postId'],
      userId: json['userId'],
      content: json['content'],
      commentcount: json['commentcount'],
      createdAt: json['createdAt'],
      userRole: json['userRole'],
    );
  }
}
