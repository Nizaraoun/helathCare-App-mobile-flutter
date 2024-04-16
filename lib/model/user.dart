class User {
  final String id;
  final String username;
  final String email;
  final String phone;
  final String cin;

  final String? image;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.cin,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      cin: json['cin'],
      image: json['image'],
    );
  }
}
