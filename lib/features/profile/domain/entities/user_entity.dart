class UserEntity {
  final String? username;
  final String? picUrl;
  final int? followers;
  final int? following;
  final AccountDetailsEntity? accountDetails;

  UserEntity({
    required this.username,
    required this.picUrl,
    required this.followers,
    required this.following,
    required this.accountDetails,
  });
}

class AccountDetailsEntity {
  final String? email;

  AccountDetailsEntity({required this.email});
}
