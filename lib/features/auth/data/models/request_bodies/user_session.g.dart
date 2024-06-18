// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSession _$UserSessionFromJson(Map<String, dynamic> json) => UserSession(
      login: json['login'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserSessionToJson(UserSession instance) =>
    <String, dynamic>{
      'login': instance.login,
      'password': instance.password,
    };

UserSessionRequest _$UserSessionRequestFromJson(Map<String, dynamic> json) =>
    UserSessionRequest(
      user: UserSession.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserSessionRequestToJson(UserSessionRequest instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
