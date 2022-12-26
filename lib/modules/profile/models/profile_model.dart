
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';
@JsonSerializable()
class ProfileModel{
  final String userID;
  final List<Integration> integrations;


  ProfileModel(this.userID,this.integrations);

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
@JsonSerializable()
class Integration{
  final bool isConnected;
  final String platform;
  Integration(this.isConnected, this.platform);
  factory Integration.fromJson(Map<String, dynamic> json) => _$IntegrationFromJson(json);
  Map<String,dynamic> toJson()=> _$IntegrationToJson(this);
}