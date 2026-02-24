import 'package:injectable/injectable.dart';

import 'package:ecommerce_app/data/datasource/secure_storage_data_source.dart';
import 'package:ecommerce_app/data/datasource/shared_pref_data_source.dart';
import 'package:ecommerce_app/domain/domain.dart';

@LazySingleton(as: LocalStorageRepository)
class LocalStorageRepositoryImpl implements LocalStorageRepository {
  LocalStorageRepositoryImpl({
    required this.sharedPrefDataSource,
    required this.secureStorageDataSource,
  });

  final SharedPrefDataSource sharedPrefDataSource;
  final SecureStorageDataSource secureStorageDataSource;

  @override
  Future<String?> getToken() => secureStorageDataSource.getToken();

  @override
  Future<void> clearToken() => secureStorageDataSource.clearToken();

  @override
  Future<UserModel?> getUser() => secureStorageDataSource.getUser();

  @override
  Future<void> clearUser() => secureStorageDataSource.clearUser();

  @override
  Future<List<int>> getFavoriteProductIds() =>
      sharedPrefDataSource.getFavoriteIds();

  @override
  Future<void> saveFavoriteProductIds(List<int> ids) =>
      sharedPrefDataSource.saveFavoriteIds(ids);

  @override
  Future<void> toggleFavoriteProductId(int id) => _handleToggleFavorite(id);

  @override
  Future<void> clearFavoriteProductIds() =>
      sharedPrefDataSource.clearFavoriteIds();

  Future<void> _handleToggleFavorite(int id) async {
    final ids = await getFavoriteProductIds();

    if (ids.contains(id)) {
      ids.remove(id);
    } else {
      ids.add(id);
    }

    await saveFavoriteProductIds(ids);
  }
}
