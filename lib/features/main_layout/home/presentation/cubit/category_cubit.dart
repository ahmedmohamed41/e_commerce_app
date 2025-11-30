import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_category_use_case.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.getCategoryUseCase}) : super(CategoryInitial());

  final GetCategoryUseCase getCategoryUseCase;

  Future<void> getCategory() async {
    if (isClosed) return;

    emit(CategoryLoading());

    final result = await getCategoryUseCase.getCategory();
    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(CategoryError(failure.message));
        }
      },
      (category) {
        if (!isClosed) {
          emit(CategorySuccess(category));
        }
      },
    );
  }

  void safeEmit(CategoryState state) {
    if (!isClosed) {
      emit(state);
    }
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
