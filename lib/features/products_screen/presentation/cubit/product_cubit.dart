import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/products_screen/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/use_cases/get_product_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.productUseCase}) : super(ProductInitial());

  final GetProductUseCase productUseCase;

  Future<void> getProducts(String? categoryId) async {
    emit(ProductLoading());

    final result = await productUseCase(categoryId);

    result.fold(
      (failure) {
        emit(ProductError(failure.message));
      },
      (product) {
        emit(ProductSuccess(product));
      },
    );
  }
}

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductEntity> products;
  ProductSuccess(this.products);
}

class ProductLoading extends ProductState {}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
