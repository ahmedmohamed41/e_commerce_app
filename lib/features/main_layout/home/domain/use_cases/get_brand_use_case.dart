import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/brand_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetBrandUseCase {
  BrandRepositories brandRepositories;
  GetBrandUseCase({required this.brandRepositories});
  Future<Either<Failure, List<BrandEntity>>> getBrand() async {
    return brandRepositories.getBrands();
  }
}