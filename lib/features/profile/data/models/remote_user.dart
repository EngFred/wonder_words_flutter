import 'package:json_annotation/json_annotation.dart';

part 'remote_user.g.dart';

@JsonSerializable()
class RemoteUser {
  final String? login;

  @JsonKey(name: 'pic_url')
  final String? picUrl;

  @JsonKey(name: 'public_favorites_count')
  final int? publicFavoritesCount;

  final int? followers;
  final int? following;

  final bool? pro;

  @JsonKey(name: 'account_details')
  final RemoteAccountDetails? accountDetails;

  RemoteUser({
    this.login,
    this.picUrl,
    this.publicFavoritesCount,
    this.followers,
    this.following,
    this.pro,
    this.accountDetails,
  });

  factory RemoteUser.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserToJson(this);
}

@JsonSerializable()
class RemoteAccountDetails {
  final String? email;

  @JsonKey(name: 'private_favorites_count')
  final int? privateFavoritesCount;

  @JsonKey(name: 'pro_expiration')
  final DateTime? proExpiration;

  RemoteAccountDetails({
    this.email,
    this.privateFavoritesCount,
    this.proExpiration,
  });

  factory RemoteAccountDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteAccountDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAccountDetailsToJson(this);
}
