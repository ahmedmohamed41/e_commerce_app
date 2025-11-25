import 'package:ecommerce_app/features/auth/data/models/user.dart';

class ResgisterResponse {
  final String message;
  final User user;
  final String token;

  ResgisterResponse({
    required this.message,
    required this.user,
    required this.token,
  });
  factory ResgisterResponse.fromjson(dynamic json) {
    return ResgisterResponse(
      message: json['message'],
      user: User.fromjson(json['user']),
      token: json['token'],
    );
  }
}
