import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_sources.dart';
import 'package:ecommerce_app/features/auth/data/models/login_reguest.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoriesImpl implements AuthRepository {
  AuthRemoteDataSources authApiRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  AuthRepositoriesImpl({
    required this.authApiRemoteDataSource,
    required this.authLocalDataSource,
  });
  @override
  Future<Either<Failure, UserEntity>> register(RegisterRequest request) async {
    try {
      final response = await authApiRemoteDataSource.register(request);
      await authLocalDataSource.saveToken(response.token);
      return Right(response.user.toUserEntity());
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(LoginReguest request) async {
    try {
      final response = await authApiRemoteDataSource.login(request);
      await authLocalDataSource.saveToken(response.token);
      return Right(response.user.toUserEntity());
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
