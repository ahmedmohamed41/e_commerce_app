class ProductEntity {
  final num? sold;
  final List<String> images;
  final int ratingsQuantity;
  final String title;
  final String description;
  final int quantity;
  final int price;
  final String imageCover;
  final double ratingsAverage;
  final String id;
  final int? priceAfterDiscount;
  final List<dynamic>? availableColors;

  ProductEntity({
    required this.sold,
    required this.images,
    required this.ratingsQuantity,
    required this.title,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.ratingsAverage,
    required this.id,
    required this.priceAfterDiscount,
    required this.availableColors,
  });
}
