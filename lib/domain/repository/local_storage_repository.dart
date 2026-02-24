import '../domain.dart';

abstract class LocalStorageRepository {
  Future<String?> getToken();

  Future<void> clearToken();

  Future<UserModel?> getUser();

  Future<void> clearUser();

  Future<List<int>> getFavoriteProductIds();

  Future<void> saveFavoriteProductIds(List<int> ids);

  Future<void> toggleFavoriteProductId(int id);

  Future<void> clearFavoriteProductIds();
}
