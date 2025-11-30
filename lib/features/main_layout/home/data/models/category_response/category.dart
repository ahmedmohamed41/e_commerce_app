import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_entity.dart';

class Category {
  final String sId;
  final String name;
  final String image;
  final String slug;
  final String createdAt;
  final String updatedAt;
  Category({
    required this.sId,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      sId: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
  CategoryEntity toCategoryEntity() =>
      CategoryEntity(sId: sId, name: name, image: image);
}
