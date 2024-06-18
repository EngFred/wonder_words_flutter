import 'package:wonder_words/features/profile/domain/entities/user_entity.dart';

abstract class UserDetailRepository {
  Stream<UserEntity> getUser(String username);
}
