import 'package:json_annotation/json_annotation.dart';
part 'preview.g.dart';


@JsonSerializable()
class Preview {
  int height;
  String url;
  int width;

  Preview({this.height, this.url, this.width});

  factory Preview.fromJson(Map<String, dynamic> data) => _$PreviewFromJson(data);

  Map<String,dynamic> toJson() => _$PreviewToJson(this);

  /*Preview.fromJson(Map<String, dynamic> json) {
    try {
      height = json['height'];
      url = json['url'];
      width = json['width'];
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    try {
      data['height'] = this.height;
      data['url'] = this.url;
      data['width'] = this.width;
    } catch (e) {
      print(e);
    }
    return data;
  }*/
}