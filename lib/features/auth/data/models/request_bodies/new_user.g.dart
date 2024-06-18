// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewUser _$NewUserFromJson(Map<String, dynamic> json) => NewUser(
      login: json['login'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$NewUserToJson(NewUser instance) => <String, dynamic>{
      'login': instance.login,
      'email': instance.email,
      'password': instance.password,
    };

NewUserRequest _$NewUserRequestFromJson(Map<String, dynamic> json) =>
    NewUserRequest(
      user: NewUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewUserRequestToJson(NewUserRequest instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
