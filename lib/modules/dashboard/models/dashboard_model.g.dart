// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      roas: (json['ROAS'] as num?)?.toDouble(),
      spend: (json['Spend'] as num?)?.toDouble(),
      checkouts: (json['checkouts'] as num?)?.toDouble(),
      cpc: (json['CPC'] as num?)?.toDouble(),
      cpm: (json['CPM'] as num?)?.toDouble(),
      cpp: (json['CPP'] as num?)?.toDouble(),
      ctr: (json['CTR'] as num?)?.toDouble(),
      orders: json['Orders'] as int?,
      revenue: (json['Revenue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'ROAS': instance.roas,
      'Spend': instance.spend,
      'Orders': instance.orders,
      'Revenue': instance.revenue,
      'CPP': instance.cpp,
      'CPM': instance.cpm,
      'CPC': instance.cpc,
      'CTR': instance.ctr,
      'checkouts': instance.checkouts,
    };
