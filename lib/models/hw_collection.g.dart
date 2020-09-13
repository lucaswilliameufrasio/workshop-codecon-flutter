// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hw_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MiniCollection _$MiniCollectionFromJson(Map<String, dynamic> json) {
  return MiniCollection(
    id: json['Id'] as int,
    name: json['Name'] as String,
    bgColor: json['BackGroundColor'] as String,
    fgColor: json['ForeGroundColor'] as String,
    seoName: json['SEOName'] as String,
    totalItems: json['TotalItems'] as int,
    imageURL: json['ImageUrl'] as String,
  );
}

Map<String, dynamic> _$MiniCollectionToJson(MiniCollection instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'BackGroundColor': instance.bgColor,
      'ForeGroundColor': instance.fgColor,
      'SEOName': instance.seoName,
      'TotalItems': instance.totalItems,
      'ImageUrl': instance.imageURL,
    };
