import 'package:json_annotation/json_annotation.dart';
part 'stat_model.g.dart';

@JsonSerializable()
class StatModel {
  StatModel({
    required this.id,
    required this.name,
    required this.spend,
    required this.orders,
    required this.cpp,
  });
  String id;
  String name;
  double spend;
  int orders;
  int cpp;

  factory StatModel.fromJson(Map<String, dynamic> json) =>
      _$StatModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatModelToJson(this);
}
