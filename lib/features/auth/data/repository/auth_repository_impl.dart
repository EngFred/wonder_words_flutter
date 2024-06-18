import 'package:logger/logger.dart';

import 'package:wonder_words/core/resource/resource.dart';
import 'package:wonder_words/features/auth/data/models/request_bodies/user_session.dart';
import 'package:wonder_words/features/auth/data/source/auth_api_service.dart';
import 'package:wonder_words/features/auth/data/models/request_bodies/new_user.dart';
import 'package:wonder_words/features/auth/domain/repository/auth_repository.dart';
import 'package:wonder_words/features/auth/utils/shared_preferences_helper.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService authApiService;
  final SharedPreferencesHelper sharedPreferencesHelper;
  final log = Logger();

  AuthRepositoryImpl({
    required this.authApiService,
    required this.sharedPreferencesHelper,
  });

  @override
  Future<Resource<String>> createUser(NewUserRequest newUserRequest) async {
    try {
      log.t("Creating new user...");
      log.t(newUserRequest.toJson());
      final response = await authApiService.createUser(newUserRequest);

      log.i(response.toJson());

      if (response.userToken != null && response.username != null) {
        log.t("User created successfully!\nSaving user token...");

        await sharedPreferencesHelper.saveUserToken(response.userToken!);
        await sharedPreferencesHelper.saveUserName(response.username!);
        log.t("User token and name also saved successfully!");
        return Success(response.userToken!);
      }

      return Error(response.errMessage!);
    } catch (e) {
      log.e("Repository error || Creating new user: $e");
      return Error(e.toString());
    }
  }

  @override
  Future<Resource<String>> loginUser(
      UserSessionRequest userSessionRequest) async {
    try {
      log.t("Creating user session...");
      log.t(userSessionRequest.toJson());
      final response = await authApiService.loginUser(userSessionRequest);

      log.i(response.toJson());

      if (response.userToken != null &&
          response.username != null &&
          response.email != null) {
        log.t("User session was successfull!\nSaving user token...");

        await sharedPreferencesHelper.saveUserToken(response.userToken!);
        await sharedPreferencesHelper.saveUserName(response.username!);
        log.t("User token and name also saved successfully!");
        return Success(response.userToken!);
      }

      return Error(response.errMessage!);
    } catch (e) {
      log.e("Repository error || Creating user session: $e");
      return Error(e.toString());
    }
  }
}
