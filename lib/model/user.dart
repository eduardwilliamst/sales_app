class User {
  final String username;
  final String email;
  final String password;

  final String createdAt;
  final String? updatedAt;

  User({
    required this.username,
    required this.email,
    required this.password,
    required this.createdAt,
    this.updatedAt,
  });
}