import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_api_response.g.dart';

@JsonSerializable()
class CreateUserResponse {
  @JsonKey(name: "User-Token")
  final String? userToken;
  @JsonKey(name: "login")
  final String? username;
  @JsonKey(name: 'error_code')
  final int? errorCode;
  @JsonKey(name: 'message')
  final String? errMessage;

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);

  CreateUserResponse(
      {this.userToken, this.username, this.errorCode, this.errMessage});

  Map<String, dynamic> toJson() => _$CreateUserResponseToJson(this);
}
