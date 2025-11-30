import 'package:ecommerce_app/features/main_layout/home/data/models/brand_response/brand.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/brand_response/metadata.dart';

class BrandResponse {
  final int results;
  final Metadata metadata;
  final List<Brand> brands;

  BrandResponse({
    required this.results,
    required this.metadata,
    required this.brands,
  });

  factory BrandResponse.fromJson(Map<String, dynamic> json) {
    return BrandResponse(
      results: json['results'],
      metadata: Metadata.fromJson(json['metadata']),
      brands: (json['data'] as List<dynamic>)
          .map((json) => Brand.fromJson(json))
          .toList(),
    );
  }
}
