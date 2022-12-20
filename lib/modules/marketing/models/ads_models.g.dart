// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsModels _$AdsModelsFromJson(Map<String, dynamic> json) => AdsModels(
      id: json['id'] as String,
      name: json['name'] as String,
      totalSpend: (json['totalSpend'] as num).toDouble(),
      totalOrders: json['totalOrders'] as int,
      totalCpp: (json['totalCpp'] as num).toDouble(),
      totalCtr: (json['totalCtr'] as num).toDouble(),
      totalCpc: (json['totalCpc'] as num).toDouble(),
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => AdModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdsModelsToJson(AdsModels instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'totalSpend': instance.totalSpend,
      'totalOrders': instance.totalOrders,
      'totalCpp': instance.totalCpp,
      'totalCtr': instance.totalCtr,
      'totalCpc': instance.totalCpc,
      'totalRevenue': instance.totalRevenue,
      'stats': instance.stats,
    };
