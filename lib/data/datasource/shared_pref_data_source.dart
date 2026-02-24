import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPrefDataSource {
  SharedPrefDataSource(this._prefs);

  final SharedPreferences _prefs;

  static const _favoriteIdsKey = 'favorite_product_ids';

  Future<void> saveFavoriteIds(List<int> ids) => _prefs.setStringList(
    _favoriteIdsKey,
    ids.map((id) => id.toString()).toList(),
  );

  Future<List<int>> getFavoriteIds() async {
    final stringList = _prefs.getStringList(_favoriteIdsKey);
    return stringList?.map(int.parse).toList() ?? [];
  }

  Future<void> clearFavoriteIds() => _prefs.remove(_favoriteIdsKey);
}
