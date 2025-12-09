import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/product_remote_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/models/product_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRemoteDataSource)
class ProductApiRemoteDataSource implements ProductRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseURL));
  @override
  Future<ProductResponse> getProducts(String? categoryId) async {
    try {
      final response = await dio.get(
        ApiConstant.productsEndPoint,
        queryParameters: categoryId == null
            ? null
            : {"category[in]": categoryId},
      );

      return ProductResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? exception.toString());
    }
  }
}
