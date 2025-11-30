import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/brand_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/brand_response/brand_response.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: BrandRemoteDataSource)
class BrandApiRemoteDataSource implements BrandRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseURL));
  @override
  Future<BrandResponse> getBrands() async {
    try {
      final response = await dio.get(ApiConstant.brandsEndPoint);
      return BrandResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Faild to Get Brands');
    }
  }
}
