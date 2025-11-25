import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/models/login_reguest.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> register(RegisterRequest request);
   Future<Either<Failure, User>>  login(LoginReguest request);
}
