import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/products_screen/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/product_repositories.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class GetProductUseCase {
  ProductRepositories productRepositories;
  GetProductUseCase({required this.productRepositories});
  Future<Either<Failure, List<ProductEntity>>> call(String? categoryId) {
    return productRepositories.getProducts(categoryId);
  }
}
