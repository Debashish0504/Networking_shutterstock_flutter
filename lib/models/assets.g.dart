// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Assets _$AssetsFromJson(Map<String, dynamic> json) {
  return Assets(
    preview: json['preview'] == null
        ? null
        : Preview.fromJson(json['preview'] as Map<String, dynamic>),
    small_thumb: json['small_thumb'] == null
        ? null
        : Preview.fromJson(json['small_thumb'] as Map<String, dynamic>),
    large_thumb: json['large_thumb'] == null
        ? null
        : Preview.fromJson(json['large_thumb'] as Map<String, dynamic>),
    huge_thumb: json['huge_thumb'] == null
        ? null
        : Preview.fromJson(json['huge_thumb'] as Map<String, dynamic>),
    preview_1000: json['preview_1000'] == null
        ? null
        : Preview.fromJson(json['preview_1000'] as Map<String, dynamic>),
    preview_1500: json['preview_1500'] == null
        ? null
        : Preview.fromJson(json['preview_1500'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AssetsToJson(Assets instance) => <String, dynamic>{
      'preview': instance.preview,
      'small_thumb': instance.small_thumb,
      'large_thumb': instance.large_thumb,
      'huge_thumb': instance.huge_thumb,
      'preview_1000': instance.preview_1000,
      'preview_1500': instance.preview_1500,
    };
