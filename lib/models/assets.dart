import 'preview.dart';
import 'package:json_annotation/json_annotation.dart';
part 'assets.g.dart';


@JsonSerializable()
class Assets {
  Preview preview;
  Preview small_thumb;
  Preview large_thumb;
  Preview huge_thumb;
  Preview preview_1000;
  Preview preview_1500;

  Assets(
      {this.preview,
        this.small_thumb,
        this.large_thumb,
        this.huge_thumb,
        this.preview_1000,
        this.preview_1500});


  factory Assets.fromJson(Map<String, dynamic> data) => _$AssetsFromJson(data);

  Map<String,dynamic> toJson() => _$AssetsToJson(this);

 /* Assets.fromJson(Map<String, dynamic> json) {
    preview =
    json['preview'] != null ? new Preview.fromJson(json['preview']) : null;
    smallThumb = json['small_thumb'] != null
        ? new Preview.fromJson(json['small_thumb'])
        : null;
    large_thumb = json['large_thumb'] != null
        ? new Preview.fromJson(json['large_thumb'])
        : null;
    huge_thumb = json['huge_thumb'] != null
        ? new Preview.fromJson(json['huge_thumb'])
        : null;
    preview_1000 = json['preview_1000'] != null
        ? new Preview.fromJson(json['preview_1000'])
        : null;
    preview_1500 = json['preview_1500'] != null
        ? new Preview.fromJson(json['preview_1500'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.preview != null) {
      data['preview'] = this.preview.toJson();
    }
    if (this.smallThumb != null) {
      data['small_thumb'] = this.smallThumb.toJson();
    }
    if (this.large_thumb != null) {
      data['large_thumb'] = this.large_thumb.toJson();
    }
    if (this.huge_thumb != null) {
      data['huge_thumb'] = this.huge_thumb.toJson();
    }
    if (this.preview_1000 != null) {
      data['preview_1000'] = this.preview_1000.toJson();
    }
    if (this.preview_1500 != null) {
      data['preview_1500'] = this.preview_1500.toJson();
    }
    return data;
  }*/
}