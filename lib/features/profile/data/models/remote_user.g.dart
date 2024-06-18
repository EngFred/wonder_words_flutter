// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteUser _$RemoteUserFromJson(Map<String, dynamic> json) => RemoteUser(
      login: json['login'] as String?,
      picUrl: json['pic_url'] as String?,
      publicFavoritesCount: (json['public_favorites_count'] as num?)?.toInt(),
      followers: (json['followers'] as num?)?.toInt(),
      following: (json['following'] as num?)?.toInt(),
      pro: json['pro'] as bool?,
      accountDetails: json['account_details'] == null
          ? null
          : RemoteAccountDetails.fromJson(
              json['account_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteUserToJson(RemoteUser instance) =>
    <String, dynamic>{
      'login': instance.login,
      'pic_url': instance.picUrl,
      'public_favorites_count': instance.publicFavoritesCount,
      'followers': instance.followers,
      'following': instance.following,
      'pro': instance.pro,
      'account_details': instance.accountDetails,
    };

RemoteAccountDetails _$RemoteAccountDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteAccountDetails(
      email: json['email'] as String?,
      privateFavoritesCount: (json['private_favorites_count'] as num?)?.toInt(),
      proExpiration: json['pro_expiration'] == null
          ? null
          : DateTime.parse(json['pro_expiration'] as String),
    );

Map<String, dynamic> _$RemoteAccountDetailsToJson(
        RemoteAccountDetails instance) =>
    <String, dynamic>{
      'email': instance.email,
      'private_favorites_count': instance.privateFavoritesCount,
      'pro_expiration': instance.proExpiration?.toIso8601String(),
    };
