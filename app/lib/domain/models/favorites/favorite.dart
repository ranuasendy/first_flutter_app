import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorite.freezed.dart';
part 'favorite.g.dart';

@freezed
abstract class Favorite with _$Favorite {
  const factory Favorite({
    int? id,
    required String pair,
  }) = _Favorite;

  factory Favorite.fromJson(Map<String, dynamic> json) => _$FavoriteFromJson(json);
}