import 'package:wonder_words/features/profile/data/models/remote_user.dart';
import 'package:wonder_words/features/profile/domain/entities/user_entity.dart';

extension RemoteUserExtension on RemoteUser {
  UserEntity toUserEntity() {
    return UserEntity(
        username: login,
        picUrl: picUrl,
        followers: followers,
        following: following,
        accountDetails: accountDetails?.toAccountDetailsEntity());
  }
}

extension RemoteAccountDetailsExtension on RemoteAccountDetails {
  AccountDetailsEntity toAccountDetailsEntity() {
    return AccountDetailsEntity(email: email);
  }
}
