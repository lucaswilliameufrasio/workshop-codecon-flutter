import 'package:json_annotation/json_annotation.dart';

part "car.g.dart";

@JsonSerializable()
class Car {
  @JsonKey(name: 'CarMetaID')
  int id;
  @JsonKey(
      name: 'CarOrderNumber', fromJson: int.tryParse, toJson: objectToString)
  int order;
  @JsonKey(name: 'TotalItems')
  int totalItems;
  @JsonKey(name: 'Title')
  String name;
  @JsonKey(name: 'MiniCollectionId')
  int collectionId;
  @JsonKey(name: 'ColorCode')
  String hexColor;
  @JsonKey(name: 'Year')
  int year;
  @JsonKey(name: 'Packagingcode')
  String packageCode;
  @JsonKey(name: 'MainImages')
  List<dynamic> mainImages;

  Car({
    this.id,
    this.order,
    this.name,
    this.totalItems,
    this.hexColor,
    this.year,
    this.packageCode,
    this.mainImages,
  });

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this);

  static String objectToString(dynamic v) {
    return String.fromCharCode(v);
  }
}
