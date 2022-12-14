import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class DashboardModel {
  @JsonKey(name: 'ROAS', required: false)
  final double? roas;
  @JsonKey(name: 'Spend', required: false)
  final double? spend;
  @JsonKey(name: 'Orders', required: false)
  final int? orders;
  @JsonKey(name: 'Revenue', required: false)
  final double? revenue;
  @JsonKey(name: 'CPP', required: false)
  final double? cpp;
  @JsonKey(name: 'CPM', required: false)
  final double? cpm;
  @JsonKey(name: 'CPC', required: false)
  final double? cpc;
  @JsonKey(name: 'CTR', required: false)
  final double? ctr;
  @JsonKey(name: 'checkouts', required: false)
  final double? checkouts;

  DashboardModel(
      {this.roas,
      this.spend,
      this.checkouts,
      this.cpc,
      this.cpm,
      this.cpp,
      this.ctr,
      this.orders,
      this.revenue});

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);
}
