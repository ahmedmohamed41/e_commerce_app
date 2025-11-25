// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart' as _i156;
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
import 'package:ecommerce_app/features/auth/repositories/auth_repository.dart'
    as _i883;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1050.AuthLocalDataSource>(
      () => _i485.AuthSharedPrefsLocalDataSource(),
    );
    gh.singleton<_i852.AuthRemoteDataSources>(
      () => _i873.AuthApiRemoteDataSource(),
    );
    gh.singleton<_i883.AuthRepository>(
      () => _i1.AuthRepositoriesImpl(
        authApiRemoteDataSource: gh<_i852.AuthRemoteDataSources>(),
        authLocalDataSource: gh<_i1050.AuthLocalDataSource>(),
      ),
    );
    gh.singleton<_i156.AuthCubit>(
      () => _i156.AuthCubit(authRepository: gh<_i883.AuthRepository>()),
    );
    return this;
  }
}
