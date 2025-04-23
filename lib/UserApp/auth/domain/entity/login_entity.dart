class LoginEntity {
  final bool success;
  final String message;
  final String token;
  final int userId;


  LoginEntity({
    required this.success,
    required this.message,
    required this.token,
    required this.userId,

  });
}
