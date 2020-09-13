// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) {
  return Car(
    id: json['CarMetaID'] as int,
    order: int.tryParse(json['CarOrderNumber'] as String),
    name: json['Title'] as String,
    totalItems: json['TotalItems'] as int,
    hexColor: json['ColorCode'] as String,
    year: json['Year'] as int,
    packageCode: json['Packagingcode'] as String,
    mainImages: json['MainImages'] as List,
  )..collectionId = json['MiniCollectionId'] as int;
}

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'CarMetaID': instance.id,
      'CarOrderNumber': Car.objectToString(instance.order),
      'TotalItems': instance.totalItems,
      'Title': instance.name,
      'MiniCollectionId': instance.collectionId,
      'ColorCode': instance.hexColor,
      'Year': instance.year,
      'Packagingcode': instance.packageCode,
      'MainImages': instance.mainImages,
    };
