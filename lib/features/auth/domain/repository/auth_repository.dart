import 'package:wonder_words/core/resource/resource.dart';
import 'package:wonder_words/features/auth/data/models/request_bodies/new_user.dart';
import 'package:wonder_words/features/auth/data/models/request_bodies/user_session.dart';

abstract class AuthRepository {
  Future<Resource<String>> createUser(NewUserRequest newUserRequest);
  Future<Resource<String>> loginUser(UserSessionRequest userSessionRequest);
}
