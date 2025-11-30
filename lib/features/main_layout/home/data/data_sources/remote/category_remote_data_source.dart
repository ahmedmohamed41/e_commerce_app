import 'package:ecommerce_app/features/main_layout/home/data/models/category_response/category_response.dart';

abstract class CategoryRemoteDataSource {
  Future<CategoryResponse> getCategories();
}
