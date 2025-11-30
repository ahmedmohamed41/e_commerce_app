import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';

import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/brand_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/brand_repositories.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BrandRepositories)
class BrandRepositoriesImpl implements BrandRepositories {
  BrandRemoteDataSource brandApiRemoteDataSource;
  BrandRepositoriesImpl({required this.brandApiRemoteDataSource});
  @override
  Future<Either<Failure, List<BrandEntity>>> getBrands() async {
    try {
      final response = await brandApiRemoteDataSource.getBrands();
      return Right(
        response.brands.map((category) => category.toBrandEntity()).toList(),
      );
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
