import 'dart:convert';
import 'package:networking_demo/services/webservice.dart';
import 'package:networking_demo/utils/constants.dart';
import 'package:json_annotation/json_annotation.dart';
import 'data.dart';
part 'imagesArticle.g.dart';

@JsonSerializable()
class ImagesArticle {
  int page;
  int perPage;
  int totalCount;
  String searchId;
  List<Data> data;

  ImagesArticle(
      {this.page, this.perPage, this.totalCount, this.searchId, this.data});

  factory ImagesArticle.fromJson(Map<String, dynamic> data) => _$ImagesArticleFromJson(data);

  Map<String,dynamic> toJson() => _$ImagesArticleToJson(this);
  /*ImagesArticle.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    totalCount = json['total_count'];
    searchId = json['search_id'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total_count'] = this.totalCount;
    data['search_id'] = this.searchId;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }*/

}

/*

import 'dart:convert';
import 'package:networking_demo/services/webservice.dart';
import 'package:networking_demo/utils/constants.dart';

class ImagesArticle {
  
  final String title; 
  final String descrption; 
  final String urlToImage; 

  ImagesArticle({this.title, this.descrption, this.urlToImage});

  factory ImagesArticle.fromJson(Map<String,dynamic> json) {
    return ImagesArticle(
      title: json['id'],
      descrption: json['description'], 
      urlToImage: Constants.Images_PLACEHOLDER_IMAGE_ASSET_URL
    );
  
}

  static Resource<List<ImagesArticle>> get all {
    
    return Resource(
      url: Constants.HEADLINE_Images_URL,
      parse: (response) {
        final result = json.decode(response.body); 
        Iterable list = result['data'];
        return list.map((model) => ImagesArticle.fromJson(model)).toList();
      }
    );

  }

}*/
