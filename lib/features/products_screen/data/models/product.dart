import 'package:ecommerce_app/features/products_screen/domain/entities/product_entity.dart';

class Product {
  final num? sold;
  final List<String> images;
  // final List<Subcategory> subcategory;
  final int ratingsQuantity;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int price;
  final String imageCover;
  // final Category category;
  // final Category brand;
  final double ratingsAverage;
  final String createdAt;
  final String updatedAt;
  final String id;
  final int? priceAfterDiscount;
  final List<dynamic>? availableColors;

  Product({
    required this.sold,
    required this.images,
    // required this.subcategory,
    required this.ratingsQuantity,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    // required this.category,
    // required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.priceAfterDiscount,
    required this.availableColors,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      sold: json['sold'] is num ? json['sold'] as num : 0,

      images: (json['images'] as List<dynamic>? ?? []).cast<String>(),

      ratingsQuantity: json['ratingsQuantity'] is int
          ? json['ratingsQuantity']
          : 0,

      title: json['title'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String? ?? '',

      quantity: json['quantity'] is int ? json['quantity'] : 0,

      price: json['price'] is int ? json['price'] : 0,

      imageCover: json['imageCover'] as String? ?? '',

      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble() ?? 0.0,

      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      id: json['id'] as String? ?? '',

      priceAfterDiscount: json['priceAfterDiscount'] == null
          ? null
          : (json['priceAfterDiscount'] as num).toInt(),

      availableColors: json['availableColors'] as List<dynamic>?,
    );
  }

  ProductEntity toProductEntity() => ProductEntity(
    sold: sold,
    images: images,
    ratingsQuantity: ratingsQuantity,
    title: title,
    description: description,
    quantity: quantity,
    price: price,
    imageCover: imageCover,
    ratingsAverage: ratingsAverage,
    id: id,
    priceAfterDiscount: priceAfterDiscount,
    availableColors: availableColors,
  );
}
