import 'package:logger/logger.dart';
import 'package:wonder_words/features/profile/data/mappers/user_mapper.dart';
import 'package:wonder_words/features/profile/data/source/user_detail_service.dart';
import 'package:wonder_words/features/profile/domain/entities/user_entity.dart';
import 'package:wonder_words/features/profile/domain/repository/user_detail_repository.dart';

class UserDetailRepositoryImpl implements UserDetailRepository {
  final UserDetailService _userDetailService;
  final Logger log = Logger();

  UserDetailRepositoryImpl({required UserDetailService userDetailService})
      : _userDetailService = userDetailService;

  @override
  Stream<UserEntity> getUser(String username) {
    try {
      return _userDetailService
          .getUser(username)
          .map((remoteUser) => remoteUser.toUserEntity());
    } catch (e) {
      log.d("Error getting using detail $e");
      return Stream.error(e);
    }
  }
}
