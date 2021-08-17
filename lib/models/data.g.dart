// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as String,
    aspect: (json['aspect'] as num)?.toDouble(),
    assets: json['assets'] == null
        ? null
        : Assets.fromJson(json['assets'] as Map<String, dynamic>),
    contributor: json['contributor'] == null
        ? null
        : Contributor.fromJson(json['contributor'] as Map<String, dynamic>),
    description: json['description'] as String,
    imageType: json['imageType'] as String,
    hasModelRelease: json['hasModelRelease'] as bool,
    mediaType: json['mediaType'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'aspect': instance.aspect,
      'assets': instance.assets,
      'contributor': instance.contributor,
      'description': instance.description,
      'imageType': instance.imageType,
      'hasModelRelease': instance.hasModelRelease,
      'mediaType': instance.mediaType,
    };
