import 'package:ecommerce_app/features/products_screen/data/models/product_response.dart';

abstract class ProductRemoteDataSource {
  Future<ProductResponse> getProducts(String? categoryId);
}
