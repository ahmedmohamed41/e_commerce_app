import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_category_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.getCategoryUseCase}) : super(CategoryInitial());

  final GetCategoryUseCase getCategoryUseCase;

  Future<void> getCategory() async {
    emit(CategoryLoading());

    final result = await getCategoryUseCase.getCategory();

    result.fold(
      (failure) {
        emit(CategoryError(failure.message));
      },
      (category) {
        emit(CategorySuccess(category));
      },
    );
  }
}

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryEntity> categories;
  CategorySuccess(this.categories);
}

class CategoryLoading extends CategoryState {}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}
