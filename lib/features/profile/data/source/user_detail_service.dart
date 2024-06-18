import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wonder_words/features/profile/data/models/remote_user.dart';

import '../../../../core/secrets/secrets.dart';
part 'user_detail_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class UserDetailService {
  factory UserDetailService(Dio dio, {String baseUrl}) = _UserDetailService;

  @GET("users/{login}")
  Stream<RemoteUser> getUser(@Path("login") String username);
}

Dio setupDioForUserInfo(String userToken) {
  final dio = Dio();
  final log = Logger();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Token token="$accessToken"';
        options.headers['User-Token'] = userToken;
        return handler.next(options);
      },
      onResponse: (response, handler) {
        log.i('DATA: ${response.data}');
        return handler.next(response);
      },
      onError: (error, handler) {
        log.t('MESSAGE: ${error.message}');
        return handler.next(error);
      },
    ),
  );

  return dio;
}
