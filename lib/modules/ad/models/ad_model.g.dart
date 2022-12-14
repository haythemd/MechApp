// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdModel _$AdModelFromJson(Map<String, dynamic> json) => AdModel(
      id: json['id'] as String,
      name: json['name'] as String,
      spend: (json['spend'] as num).toDouble(),
      orders: json['orders'] as int,
      cpp: json['cpp'] as int,
    );

Map<String, dynamic> _$AdModelToJson(AdModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'spend': instance.spend,
      'orders': instance.orders,
      'cpp': instance.cpp,
    };
