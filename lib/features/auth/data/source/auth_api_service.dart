import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wonder_words/core/secrets/secrets.dart';
import 'package:wonder_words/features/auth/data/models/request_bodies/user_session.dart';
import 'package:wonder_words/features/auth/data/models/response_bodies/create_user_api_response.dart';
import 'package:wonder_words/features/auth/data/models/request_bodies/new_user.dart';
import 'package:wonder_words/features/auth/data/models/response_bodies/user_session_api_response.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST("users")
  Future<CreateUserResponse> createUser(@Body() NewUserRequest userRequest);

  @POST("session")
  Future<UserSessionResponse> loginUser(
      @Body() UserSessionRequest userSessionRequest);
}

Dio setupDioForAuth() {
  final dio = Dio();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Token token="$accessToken"';
        return handler.next(options);
      },
    ),
  );

  return dio;
}
