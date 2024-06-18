import 'package:logger/logger.dart';
import 'package:wonder_words/features/details/data/mappers/quote_details_mapper.dart';
import 'package:wonder_words/features/details/data/source/quote_detail_api_service.dart';
import 'package:wonder_words/features/details/domain/entities/quote_detail_model.dart';
import 'package:wonder_words/features/details/domain/repository/quote_detail_repository.dart';

class QuoteDetailReposiotryImpl extends QuoteDetailRepository {
  final QuoteDetailApiService _quoteDetailApiService;
  final log = Logger();

  QuoteDetailReposiotryImpl(
      {required QuoteDetailApiService quoteDetailApiService})
      : _quoteDetailApiService = quoteDetailApiService;

  @override
  Stream<QuoteDetailsModel> fetchQuoteDetails(int quoteId) {
    try {
      return _quoteDetailApiService.fetchQuoteById(quoteId).map(
          (remoteQuoteDetails) => remoteQuoteDetails.toQuoteDetailsModel());
    } catch (e) {
      log.e("Error fetching quote details ::: Repository $e");
      return Stream.error("$e");
    }
  }

  @override
  Future<QuoteDetailsModel?> clearVote(int quoteId) async {
    try {
      log.t("Clearing votes...");
      final res = await _quoteDetailApiService.clearVote(quoteId);
      log.t("Votes cleared successfully!");
      return res.toQuoteDetailsModel();
    } catch (e) {
      log.e("Error clearing vote ::: Repository $e");
      return null;
    }
  }

  @override
  Future<QuoteDetailsModel?> downvoteQuote(int quoteId) async {
    try {
      log.t("Downvoting...!");
      final res = await _quoteDetailApiService.downvoteQuote(quoteId);
      log.t("Downvote successful!");
      return res.toQuoteDetailsModel();
    } catch (e) {
      log.e("Error dwonvoting quote ::: Repository $e");
      return null;
    }
  }

  @override
  Future<QuoteDetailsModel?> favQuote(int quoteId) async {
    try {
      log.t("Adding to fav...");
      final res = await _quoteDetailApiService.favQuote(quoteId);
      log.t("Favored successfully!");
      return res.toQuoteDetailsModel();
    } catch (e) {
      log.e("Failed to fav quote ::: Repository $e");
      return null;
    }
  }

  @override
  Future<QuoteDetailsModel?> unfavQuote(int quoteId) async {
    try {
      log.t("Removing fav...");
      final res = await _quoteDetailApiService.unFavQuote(quoteId);
      log.t("UnFavored successfully!");
      return res.toQuoteDetailsModel();
    } catch (e) {
      log.e("Failed to unfav quote ::: Repository $e");
      return null;
    }
  }

  @override
  Future<QuoteDetailsModel?> upvoteQuote(int quoteId) async {
    try {
      log.t("Upvoting...");
      final res = await _quoteDetailApiService.upvoteQuote(quoteId);
      log.t("Upvote successfully!");
      return res.toQuoteDetailsModel();
    } catch (e) {
      log.e("Failed to upvote quote ::: Repository $e");
      return null;
    }
  }
}
