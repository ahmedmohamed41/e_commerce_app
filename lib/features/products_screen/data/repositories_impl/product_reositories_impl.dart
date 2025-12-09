import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/product_remote_data_source.dart';
import 'package:ecommerce_app/features/products_screen/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/product_repositories.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepositories)
class ProductReositoriesImpl implements ProductRepositories {
  ProductRemoteDataSource productApiRemoteDataSource;
  ProductReositoriesImpl({required this.productApiRemoteDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(
    String? categoryId,
  ) async {
    try {
      final response = await productApiRemoteDataSource.getProducts(categoryId);
      return Right(
        response.products.map((product) => product.toProductEntity()).toList(),
      );
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
