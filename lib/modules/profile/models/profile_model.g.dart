// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      json['userID'] as String,
      (json['integrations'] as List<dynamic>)
          .map((e) => Integration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'integrations': instance.integrations,
    };

Integration _$IntegrationFromJson(Map<String, dynamic> json) => Integration(
      json['isConnected'] as bool,
      json['platform'] as String,
    );

Map<String, dynamic> _$IntegrationToJson(Integration instance) =>
    <String, dynamic>{
      'isConnected': instance.isConnected,
      'platform': instance.platform,
    };
