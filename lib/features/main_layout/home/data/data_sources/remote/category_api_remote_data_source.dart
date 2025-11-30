import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/category_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category_response/category_response.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: CategoryRemoteDataSource)
class CategoryApiRemoteDataSource implements CategoryRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseURL));
  @override
  Future<CategoryResponse> getCategories() async {
    try {
      final response = await dio.get(ApiConstant.categoriesEndPoint);
      return CategoryResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Faild to Get Categories');
    }
  }
}
