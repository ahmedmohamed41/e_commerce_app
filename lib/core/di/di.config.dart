// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i1050;
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart'
    as _i485;
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i873;
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_sources.dart'
    as _i852;
import 'package:ecommerce_app/features/auth/data/repositories_impl/repositories_impl.dart'
    as _i1;
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart'
    as _i804;
import 'package:ecommerce_app/features/auth/domain/use_cases/login_use_case.dart'
    as _i1044;
import 'package:ecommerce_app/features/auth/domain/use_cases/register_use_case.dart'
    as _i552;
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart'
    as _i118;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/brand_api_remote_data_source.dart'
    as _i1023;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/brand_remote_data_source.dart'
    as _i961;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/category_api_remote_data_source.dart'
    as _i648;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/category_remote_data_source.dart'
    as _i708;
import 'package:ecommerce_app/features/main_layout/home/data/repositories_impl/brand_repositories_impl.dart'
    as _i48;
import 'package:ecommerce_app/features/main_layout/home/data/repositories_impl/category_repositories_impl.dart'
    as _i7;
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/brand_repositories.dart'
    as _i882;
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/category_repositories.dart'
    as _i578;
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_brand_use_case.dart'
    as _i828;
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_category_use_case.dart'
    as _i744;
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/brand_cubit.dart'
    as _i845;
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/category_cubit.dart'
    as _i456;
import 'package:ecommerce_app/features/products_screen/data/data_sources/product_api_remote_data_source.dart'
    as _i965;
import 'package:ecommerce_app/features/products_screen/data/data_sources/product_remote_data_source.dart'
    as _i888;
import 'package:ecommerce_app/features/products_screen/data/repositories_impl/product_reositories_impl.dart'
    as _i21;
import 'package:ecommerce_app/features/products_screen/domain/repositories/product_repositories.dart'
    as _i289;
import 'package:ecommerce_app/features/products_screen/domain/use_cases/get_product_use_case.dart'
    as _i82;
import 'package:ecommerce_app/features/products_screen/presentation/cubit/product_cubit.dart'
    as _i463;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i961.BrandRemoteDataSource>(
      () => _i1023.BrandApiRemoteDataSource(),
    );
    gh.singleton<_i1050.AuthLocalDataSource>(
      () => _i485.AuthSharedPrefsLocalDataSource(),
    );
    gh.lazySingleton<_i882.BrandRepositories>(
      () => _i48.BrandRepositoriesImpl(
        brandApiRemoteDataSource: gh<_i961.BrandRemoteDataSource>(),
      ),
    );
    gh.singleton<_i852.AuthRemoteDataSources>(
      () => _i873.AuthApiRemoteDataSource(),
    );
    gh.lazySingleton<_i708.CategoryRemoteDataSource>(
      () => _i648.CategoryApiRemoteDataSource(),
    );
    gh.lazySingleton<_i888.ProductRemoteDataSource>(
      () => _i965.ProductApiRemoteDataSource(),
    );
    gh.lazySingleton<_i289.ProductRepositories>(
      () => _i21.ProductReositoriesImpl(
        productApiRemoteDataSource: gh<_i888.ProductRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i578.CategoryRepositories>(
      () => _i7.CategoryRepositoriesImpl(
        categoryApiRemoteDataSource: gh<_i708.CategoryRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i828.GetBrandUseCase>(
      () => _i828.GetBrandUseCase(
        brandRepositories: gh<_i882.BrandRepositories>(),
      ),
    );
    gh.singleton<_i804.AuthRepository>(
      () => _i1.AuthRepositoriesImpl(
        authApiRemoteDataSource: gh<_i852.AuthRemoteDataSources>(),
        authLocalDataSource: gh<_i1050.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i82.GetProductUseCase>(
      () => _i82.GetProductUseCase(
        productRepositories: gh<_i289.ProductRepositories>(),
      ),
    );
    gh.singleton<_i1044.LoginUseCase>(
      () => _i1044.LoginUseCase(authRepository: gh<_i804.AuthRepository>()),
    );
    gh.singleton<_i552.RegisterUseCase>(
      () => _i552.RegisterUseCase(authRepository: gh<_i804.AuthRepository>()),
    );
    gh.lazySingleton<_i744.GetCategoryUseCase>(
      () => _i744.GetCategoryUseCase(
        categoryRepositories: gh<_i578.CategoryRepositories>(),
      ),
    );
    gh.factory<_i463.ProductCubit>(
      () => _i463.ProductCubit(productUseCase: gh<_i82.GetProductUseCase>()),
    );
    gh.singleton<_i118.AuthCubit>(
      () => _i118.AuthCubit(
        registerUseCase: gh<_i552.RegisterUseCase>(),
        loginUseCase: gh<_i1044.LoginUseCase>(),
      ),
    );
    gh.factory<_i456.CategoryCubit>(
      () => _i456.CategoryCubit(
        getCategoryUseCase: gh<_i744.GetCategoryUseCase>(),
      ),
    );
    gh.factory<_i845.BrandCubit>(
      () => _i845.BrandCubit(getBrandUseCase: gh<_i828.GetBrandUseCase>()),
    );
    return this;
  }
}
