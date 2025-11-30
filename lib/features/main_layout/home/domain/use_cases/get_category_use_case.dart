import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/category_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCategoryUseCase {
  CategoryRepositories categoryRepositories;
  GetCategoryUseCase({required this.categoryRepositories});
  Future<Either<Failure, List<CategoryEntity>>> getCategory() async {
    return categoryRepositories.getCategories();
  }
}
