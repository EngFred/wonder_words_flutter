// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSessionResponse _$UserSessionResponseFromJson(Map<String, dynamic> json) =>
    UserSessionResponse(
      userToken: json['User-Token'] as String?,
      username: json['login'] as String?,
      email: json['email'] as String?,
      errorCode: (json['error_code'] as num?)?.toInt(),
      errMessage: json['message'] as String?,
    );

Map<String, dynamic> _$UserSessionResponseToJson(
        UserSessionResponse instance) =>
    <String, dynamic>{
      'User-Token': instance.userToken,
      'login': instance.username,
      'email': instance.email,
      'error_code': instance.errorCode,
      'message': instance.errMessage,
    };
