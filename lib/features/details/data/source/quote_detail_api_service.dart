import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wonder_words/features/details/data/models/remote_quote_detail.dart';

import '../../../../core/secrets/secrets.dart';

part 'quote_detail_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class QuoteDetailApiService {
  factory QuoteDetailApiService(Dio dio, {String baseUrl}) =
      _QuoteDetailApiService;

  @GET("quotes/{quote_id}")
  Stream<RemoteQuoteDetails> fetchQuoteById(@Path("quote_id") int quoteId);

  @PUT("quotes/{quote_id}/fav")
  Future<RemoteQuoteDetails> favQuote(@Path("quote_id") int quoteId);

  @PUT("quotes/{quote_id}/unfav")
  Future<RemoteQuoteDetails> unFavQuote(@Path("quote_id") int quoteId);

  @PUT("quotes/{quote_id}/upvote")
  Future<RemoteQuoteDetails> upvoteQuote(@Path("quote_id") int quoteId);

  @PUT("quotes/{quote_id}/downvote")
  Future<RemoteQuoteDetails> downvoteQuote(@Path("quote_id") int quoteId);

  @PUT("quotes/{quote_id}/clearvote")
  Future<RemoteQuoteDetails> clearVote(@Path("quote_id") int quoteId);
}

Dio setupDioForQuoteDetails(String userToken) {
  final dio = Dio();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Token token="$accessToken"';
        options.headers['User-Token'] = userToken;
        return handler.next(options);
      },
    ),
  );

  return dio;
}
