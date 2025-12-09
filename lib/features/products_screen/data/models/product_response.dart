import 'package:ecommerce_app/features/main_layout/home/data/models/category_response/metadata.dart';
import 'package:ecommerce_app/features/products_screen/data/models/product.dart';

class ProductResponse {
  final int results;
  final Metadata metadata;
  final List<Product> products;

  ProductResponse({
    required this.results,
    required this.metadata,
    required this.products,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      results: json['results'],
      metadata: Metadata.fromJson(json['metadata']),
      products: (json['data'] as List<dynamic>)
          .map((json) => Product.fromJson(json))
          .toList(),
    );
  }
}

