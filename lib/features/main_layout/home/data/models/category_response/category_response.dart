import 'package:ecommerce_app/features/main_layout/home/data/models/category_response/category.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category_response/metadata.dart';

class CategoryResponse {
  final int results;
  final Metadata metadata;
  final List<Category> categories;

  CategoryResponse({
    required this.results,
    required this.metadata,
    required this.categories,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      results: json['results'],
      metadata: Metadata.fromJson(json['metadata']),
      categories: (json['data'] as List<dynamic>)
          .map((json) => Category.fromJson(json))
          .toList(),
    );
  }
}
