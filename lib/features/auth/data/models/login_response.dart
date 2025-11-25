import 'package:ecommerce_app/features/auth/data/models/user.dart';

class LoginResponse {
  final String message;
  final User user;
  final String token;

  LoginResponse({
    required this.message,
    required this.user,
    required this.token,
  });
  factory LoginResponse.fromjson(dynamic json) {
    return LoginResponse(
      message: json['message'],
      user: User.fromjson(json['user']),
      token: json['token'],
    );
  }
}
