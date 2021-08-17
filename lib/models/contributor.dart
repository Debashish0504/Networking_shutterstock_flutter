import 'package:json_annotation/json_annotation.dart';
part 'contributor.g.dart';


@JsonSerializable()
class Contributor {
  String id;

  Contributor({this.id});

  factory Contributor.fromJson(Map<String, dynamic> data) => _$ContributorFromJson(data);

  Map<String,dynamic> toJson() => _$ContributorToJson(this);

  /*
  Contributor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }*/
}