import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_model.g.dart';

@JsonSerializable()
class ResetPasswordRequest {
  final String email;
  final String password;

  ResetPasswordRequest(this.email,this.password);


  factory ResetPasswordRequest.fromJson(Map<String,dynamic> json)=> _$ResetPasswordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}

