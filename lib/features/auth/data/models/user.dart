import 'package:ecommerce_app/features/auth/domain/entities/user_entity.dart';

class User {
  final String name;
  final String email;
  final String role;

  User({required this.name, required this.email, required this.role});
  factory User.fromjson(dynamic json) {
    return User(name: json['name'], email: json['email'], role: json['role']);
  }

  UserEntity toUserEntity() => UserEntity(name: name, email: email, role: role);
}
