import 'package:first_flutter_app/domain/models/favorites/favorite.dart';
import 'package:first_flutter_app/utils/result.dart';

abstract class FavoritesRepository {
  Future<Result<List<Favorite>>> getFavoriteList();
  Future<Result<void>> createFavorite(Favorite favorite);
  // Future<Result<void>> deleteFavorite(int id);
}