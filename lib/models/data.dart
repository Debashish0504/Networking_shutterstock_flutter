import 'dart:convert';

import 'package:networking_demo/services/webservice.dart';
import 'package:networking_demo/utils/constants.dart';

import 'assets.dart';
import 'contributor.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';


@JsonSerializable()
class Data {
  String id;
  double aspect;
  Assets assets;
  Contributor contributor;
  String description;
  String imageType;
  bool hasModelRelease;
  String mediaType;

  Data(
      {this.id,
        this.aspect,
        this.assets,
        this.contributor,
        this.description,
        this.imageType,
        this.hasModelRelease,
        this.mediaType});

  factory Data.fromJson(Map<String, dynamic> data) => _$DataFromJson(data);

  Map<String,dynamic> toJson() => _$DataToJson(this);

  /*
  Data.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      aspect = json['aspect'];
      assets =
          json['assets'] != null ? new Assets.fromJson(json['assets']) : null;
      contributor = json['contributor'] != null
              ? new Contributor.fromJson(json['contributor'])
              : null;
      description = json['description'];
      imageType = json['image_type'];
      hasModelRelease = json['has_model_release'];
      mediaType = json['media_type'];
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    try {
      data['id'] = this.id;
      data['aspect'] = this.aspect;
      if (this.assets != null) {
            data['assets'] = this.assets.toJson();
          }
      if (this.contributor != null) {
            data['contributor'] = this.contributor.toJson();
          }
      data['description'] = this.description;
      data['image_type'] = this.imageType;
      data['has_model_release'] = this.hasModelRelease;
      data['media_type'] = this.mediaType;
    } catch (e) {
      print(e);
    }
    return data;
  }*/

  static Resource<List<Data>> get all {

    return Resource(
        url: Constants.HEADLINE_Images_URL,
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['data'];
          return list.map((model) => Data.fromJson(model)).toList();
        }
    );

  }
}