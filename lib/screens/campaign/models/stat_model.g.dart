// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatModel _$StatModelFromJson(Map<String, dynamic> json) => StatModel(
      id: json['id'] as String,
      name: json['name'] as String,
      spend: (json['spend'] as num).toDouble(),
      orders: json['orders'] as int,
      cpp: json['cpp'] as int,
    );

Map<String, dynamic> _$StatModelToJson(StatModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'spend': instance.spend,
      'orders': instance.orders,
      'cpp': instance.cpp,
    };
