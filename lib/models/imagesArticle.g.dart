// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagesArticle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesArticle _$ImagesArticleFromJson(Map<String, dynamic> json) {
  return ImagesArticle(
    page: json['page'] as int,
    perPage: json['perPage'] as int,
    totalCount: json['totalCount'] as int,
    searchId: json['searchId'] as String,
    data: (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ImagesArticleToJson(ImagesArticle instance) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'totalCount': instance.totalCount,
      'searchId': instance.searchId,
      'data': instance.data,
    };
