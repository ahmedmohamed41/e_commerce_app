import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class RegisterUseCase {
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});
  Future<Either<Failure, UserEntity>> call(RegisterRequest request) async {
    return authRepository.register(request);
  }
}
