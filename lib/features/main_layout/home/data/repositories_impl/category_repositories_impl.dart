import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/category_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/category_repositories.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoryRepositories)
class CategoryRepositoriesImpl implements CategoryRepositories {
  CategoryRemoteDataSource categoryApiRemoteDataSource;
  CategoryRepositoriesImpl({required this.categoryApiRemoteDataSource});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final response = await categoryApiRemoteDataSource.getCategories();
      return Right(
        response.categories
            .map((category) => category.toCategoryEntity())
            .toList(),
      );
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
