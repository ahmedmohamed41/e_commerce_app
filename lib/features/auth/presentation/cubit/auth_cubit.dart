import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/data/models/login_reguest.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.registerUseCase, required this.loginUseCase})
    : super(AuthCubitInitial());
  RegisterUseCase registerUseCase; 
  LoginUseCase loginUseCase;

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    final result = await registerUseCase(request);
    result.fold(
      (failure) {
        emit(RegisterError(message: failure.message));
      },
      (user) {
        emit(RegisterSuccess());
      },
    );
  }

  Future<void> login(LoginReguest request) async {
    emit(LoginLoading());
    var result = await loginUseCase(request);
    result.fold(
      (failure) {
        emit(LoginError(message: failure.message));
      },
      (user) {
        emit(LoginSuccess());
      },
    );
  }
}

abstract class AuthState {}

final class AuthCubitInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterError extends AuthState {
  final String message;

  RegisterError({required this.message});
}

final class RegisterSuccess extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginError extends AuthState {
  final String message;

  LoginError({required this.message});
}

final class LoginSuccess extends AuthState {}
