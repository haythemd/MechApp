// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailedAdModel _$DetailedAdModelFromJson(Map<String, dynamic> json) =>
    DetailedAdModel(
      adMetrics: AdsModels.fromJson(json['adMetrics'] as Map<String, dynamic>),
      creatives: (json['creatives'] as List<dynamic>?)
          ?.map((e) => Creative.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailedAdModelToJson(DetailedAdModel instance) =>
    <String, dynamic>{
      'adMetrics': instance.adMetrics,
      'creatives': instance.creatives,
    };

Creative _$CreativeFromJson(Map<String, dynamic> json) => Creative(
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String,
      metrics: AdsModels.fromJson(json['metrics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreativeToJson(Creative instance) => <String, dynamic>{
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'metrics': instance.metrics,
    };
