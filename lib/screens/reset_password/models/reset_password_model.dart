import 'package:json_annotation/json_annotation.dart';

part 'reset_password_model.g.dart';
@JsonSerializable()
class ResetPasswordResponse {
  final String responseStatus;
  final String responseData;
  ResetPasswordResponse(this.responseStatus,this.responseData);
  factory ResetPasswordResponse.fromJson(Map<String,dynamic> json)=> _$ResetPasswordResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);

}