// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Favorite _$FavoriteFromJson(Map<String, dynamic> json) =>
    _Favorite(id: (json['id'] as num?)?.toInt(), pair: json['pair'] as String);

Map<String, dynamic> _$FavoriteToJson(_Favorite instance) => <String, dynamic>{
  'id': instance.id,
  'pair': instance.pair,
};
