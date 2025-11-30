import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_brand_use_case.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BrandCubit extends Cubit<BrandState> {
  BrandCubit({required this.getBrandUseCase}) : super(CategoryInitial());

  final GetBrandUseCase getBrandUseCase;

  Future<void> getBrand() async {
    if (isClosed) return;

    emit(BrandLoading());

    final result = await getBrandUseCase.getBrand();
    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(BrandError(failure.message));
        }
      },
      (brand) {
        if (!isClosed) {
          emit(BrandSuccess(brand));
        }
      },
    );
  }

  void safeEmit(BrandState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}

abstract class BrandState {}

class CategoryInitial extends BrandState {}

class BrandSuccess extends BrandState {
  final List<BrandEntity> brands;
 BrandSuccess(this.brands);
}

class BrandLoading extends BrandState {}

class BrandError extends BrandState {
  final String message;
  BrandError(this.message);
}
