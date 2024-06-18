// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) =>
    CreateUserResponse(
      userToken: json['User-Token'] as String?,
      username: json['login'] as String?,
      errorCode: (json['error_code'] as num?)?.toInt(),
      errMessage: json['message'] as String?,
    );

Map<String, dynamic> _$CreateUserResponseToJson(CreateUserResponse instance) =>
    <String, dynamic>{
      'User-Token': instance.userToken,
      'login': instance.username,
      'error_code': instance.errorCode,
      'message': instance.errMessage,
    };
