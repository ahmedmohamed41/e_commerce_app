import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_sources.dart';
import 'package:ecommerce_app/features/auth/data/models/login_reguest.dart';
import 'package:ecommerce_app/features/auth/data/models/login_response.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/register_response.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: AuthRemoteDataSources)
class AuthApiRemoteDataSource implements AuthRemoteDataSources {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseURL));
  @override
  Future<ResgisterResponse> register(RegisterRequest request) async {
    try {
      Response response = await dio.post(
        ApiConstant.registerEndPoint,
        data: request.toJson(),
      );

      return ResgisterResponse.fromjson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Faild to Register');
    }
  }

  @override
  Future<LoginResponse> login(LoginReguest request) async {
    try {
      Response response = await dio.post(
        ApiConstant.loginEndPoint,
        data: request.toJson(),
      );
      return LoginResponse.fromjson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Faild to login');
    }
  }
}
