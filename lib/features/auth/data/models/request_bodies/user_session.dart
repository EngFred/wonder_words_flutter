import 'package:json_annotation/json_annotation.dart';

part 'user_session.g.dart';

@JsonSerializable()
class UserSession {
  final String login;
  final String password;

  UserSession({
    required this.login,
    required this.password,
  });

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);
  Map<String, dynamic> toJson() => _$UserSessionToJson(this);
}

@JsonSerializable()
class UserSessionRequest {
  final UserSession user;

  UserSessionRequest({
    required this.user,
  });

  factory UserSessionRequest.fromJson(Map<String, dynamic> json) =>
      _$UserSessionRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UserSessionRequestToJson(this);
}
