import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';

class Brand {
  final String sId;
  final String name;
  final String image;
  final String slug;
  final String createdAt;
  final String updatedAt;

  Brand({
    required this.sId,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      sId: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  BrandEntity toBrandEntity() =>
      BrandEntity(sId: sId, name: name, image: image);
}
