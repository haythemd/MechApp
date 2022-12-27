import 'package:json_annotation/json_annotation.dart';
part 'ad_model.g.dart';

@JsonSerializable()
class AdModel {
  String id;
  String name;
  double spend;
  int orders;
  int cpp;

  AdModel(
      {required this.id,
      required this.name,
      required this.spend,
      required this.orders,
      required this.cpp});

  factory AdModel.fromJson(Map<String, dynamic> json) =>
      _$AdModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdModelToJson(this);


}
