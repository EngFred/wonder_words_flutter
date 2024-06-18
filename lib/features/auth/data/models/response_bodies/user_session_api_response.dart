import 'package:json_annotation/json_annotation.dart';

part 'user_session_api_response.g.dart';

@JsonSerializable()
class UserSessionResponse {
  @JsonKey(name: "User-Token")
  final String? userToken;
  @JsonKey(name: "login")
  final String? username;
  final String? email;
  @JsonKey(name: 'error_code')
  final int? errorCode;
  @JsonKey(name: 'message')
  final String? errMessage;

  factory UserSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSessionResponseFromJson(json);

  UserSessionResponse(
      {this.userToken,
      this.username,
      this.email,
      this.errorCode,
      this.errMessage});

  Map<String, dynamic> toJson() => _$UserSessionResponseToJson(this);
}
