// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce_app/data/data.dart' as _i957;
import 'package:ecommerce_app/data/datasource/secure_storage_data_source.dart' as _i556;
import 'package:ecommerce_app/data/datasource/shared_pref_data_source.dart' as _i1068;
import 'package:ecommerce_app/data/repository/auth_repository_impl.dart' as _i1020;
import 'package:ecommerce_app/data/repository/local_storage_repository_impl.dart' as _i463;
import 'package:ecommerce_app/data/repository/product_repository_impl.dart' as _i540;
import 'package:ecommerce_app/data/services/auth_service.dart' as _i399;
import 'package:ecommerce_app/data/services/fake_store_service.dart' as _i692;
import 'package:ecommerce_app/domain/domain.dart' as _i1016;
import 'package:ecommerce_app/injection.dart' as _i699;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i1068.SharedPrefDataSource>(() => _i1068.SharedPrefDataSource(gh<_i460.SharedPreferences>()));
    gh.factory<_i692.FakeStoreService>(() => _i692.FakeStoreService(gh<_i361.Dio>()));
    gh.factory<_i399.AuthService>(() => _i399.AuthService(gh<_i361.Dio>()));
    gh.lazySingleton<_i556.SecureStorageDataSource>(
        () => _i556.SecureStorageDataSource(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i1016.ProductRepository>(() => _i540.ProductRepositoryImpl(gh<_i957.FakeStoreService>()));
    gh.lazySingleton<_i1016.AuthRepository>(() => _i1020.AuthRepositoryImpl(
          secureStorageDataSource: gh<_i556.SecureStorageDataSource>(),
          authService: gh<_i957.AuthService>(),
        ));
    gh.lazySingleton<_i1016.LocalStorageRepository>(() => _i463.LocalStorageRepositoryImpl(
          sharedPrefDataSource: gh<_i1068.SharedPrefDataSource>(),
          secureStorageDataSource: gh<_i556.SecureStorageDataSource>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i699.RegisterModule {}
