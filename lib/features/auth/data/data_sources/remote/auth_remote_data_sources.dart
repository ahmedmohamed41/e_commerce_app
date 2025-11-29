import 'package:ecommerce_app/features/auth/data/models/login_reguest.dart';
import 'package:ecommerce_app/features/auth/data/models/login_response.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/register_response.dart';

abstract class AuthRemoteDataSources {
  Future<ResgisterResponse> register(RegisterRequest request);
  Future<LoginResponse> login(LoginReguest request);
}
