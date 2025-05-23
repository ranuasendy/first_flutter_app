import 'package:first_flutter_app/data/repositories/favorites/favorites_repository.dart';
import 'package:first_flutter_app/data/services/local/local_data_service.dart';
import 'package:first_flutter_app/domain/models/favorites/favorite.dart';
import 'package:first_flutter_app/utils/result.dart';

class FavoritesRepositoryLocal implements FavoritesRepository {
  FavoritesRepositoryLocal({ required LocalDataService localDataService }) : _localDataService = localDataService;

  int _sequentialId = 0;

  final _favorites = List<Favorite>.empty(growable: true);
  final LocalDataService _localDataService;

  @override
  Future<Result<void>> createFavorite(Favorite favorite) async {
    final favWithId = favorite.copyWith(id: _sequentialId++);
    _favorites.add(favWithId);
    return const Result.ok(null);
  }

  @override
  Future<Result<List<Favorite>>> getFavoriteList() async {
    return Result.ok(_createList());
  }

  List<Favorite> _createList() {
    return _favorites.map((favorite) => Favorite(
      id: favorite.id!,
      pair: favorite.pair
    )).toList();
  }
}