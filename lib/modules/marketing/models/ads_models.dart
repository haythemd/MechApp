import 'package:json_annotation/json_annotation.dart';
import 'package:mechalodon_mobile/modules/marketing/models/ad_model.dart';

part 'ads_models.g.dart';

@JsonSerializable()
class AdsModels {
  String id;
  String name;
  double totalSpend;
  int totalOrders;
  double totalCpp;
  double totalCtr;
  double totalCpc;
  double totalRevenue;
  List<AdModel> stats;

AdsModels(
      {required this.id,
      required this.name,
      required this.totalSpend,
      required this.totalOrders,
      required this.totalCpp,
      required this.totalCtr,
      required this.totalCpc,
      required this.totalRevenue,
      required this.stats});

  factory AdsModels.fromJson(Map<String, dynamic> json) =>
      _$AdsModelsFromJson(json);

  Map<String, dynamic> toJson() => _$AdsModelsToJson(this);
}
