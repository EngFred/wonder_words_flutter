import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_user.g.dart';

@JsonSerializable()
class NewUser {
  final String login;
  final String email;
  final String password;

  NewUser({
    required this.login,
    required this.email,
    required this.password,
  });

  factory NewUser.fromJson(Map<String, dynamic> json) =>
      _$NewUserFromJson(json);
  Map<String, dynamic> toJson() => _$NewUserToJson(this);
}

@JsonSerializable()
class NewUserRequest {
  final NewUser user;

  NewUserRequest({
    required this.user,
  });

  factory NewUserRequest.fromJson(Map<String, dynamic> json) =>
      _$NewUserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$NewUserRequestToJson(this);
}
