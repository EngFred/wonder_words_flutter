import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wonder_words/features/quotes/data/models/remote_quote_of_the_day.dart';
import 'package:wonder_words/features/quotes/data/models/remote_quotes_response.dart';

import '../../../../core/secrets/secrets.dart';

part 'quotes_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class QuotesApiService {
  factory QuotesApiService(Dio dio, {String baseUrl}) = _QuotesApiService;

  @GET("quotes")
  Future<RemoteQuotesResponse> fetchAllQuotes();

  @GET("quotes")
  Future<RemoteQuotesResponse> fetchQuotesByCategory(
      @Query("filter") String category);

  @GET("qotd")
  Future<RemoteQuoteOfTheDay> fetchQuoteOfTheDay();
}

Dio setupDioForQuotes(String userToken) {
  final dio = Dio();
  final log = Logger();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        log.t('REQUEST: ${options.method} ${options.path}');
        log.t('HEADERS: ${options.headers}');
        log.t('DATA: ${options.data}');
        options.headers['Authorization'] = 'Token token="$accessToken"';
        options.headers['User-Token'] = userToken;
        return handler.next(options);
      },
      onResponse: (response, handler) {
        log.i(
            'RESPONSE: ${response.statusCode} ${response.requestOptions.path}');
        log.i('DATA: ${response.data}');
        return handler.next(response);
      },
      onError: (error, handler) {
        log.t(
            'ERROR: ${error.response?.statusCode} ${error.response?.requestOptions.path}');
        log.t('MESSAGE: ${error.message}');
        return handler.next(error);
      },
    ),
  );

  return dio;
}
