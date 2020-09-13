import 'package:json_annotation/json_annotation.dart';

part 'hw_collection.g.dart';

@JsonSerializable()
class MiniCollection {
  @JsonKey(name: 'Id')
  int id;
  @JsonKey(name: 'Name')
  String name;
  @JsonKey(name: 'BackGroundColor')
  String bgColor;
  @JsonKey(name: 'ForeGroundColor')
  String fgColor;
  @JsonKey(name: 'SEOName')
  String seoName;
  @JsonKey(name: 'TotalItems')
  int totalItems;
  @JsonKey(name: 'ImageUrl')
  String imageURL;

  MiniCollection({
    this.id,
    this.name,
    this.bgColor,
    this.fgColor,
    this.seoName,
    this.totalItems,
    this.imageURL,
  });

  factory MiniCollection.fromJson(Map<String, dynamic> json) =>
      _$MiniCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$MiniCollectionToJson(this);
}
