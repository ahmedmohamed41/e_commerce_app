import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/models/login_reguest.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  Future<Either<Failure, UserEntity>> call(LoginReguest request) async {
    return authRepository.login(request);
  }
}
