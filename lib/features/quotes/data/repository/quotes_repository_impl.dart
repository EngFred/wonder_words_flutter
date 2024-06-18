import 'package:logger/logger.dart';
import 'package:wonder_words/core/resource/resource.dart';
import 'package:wonder_words/features/quotes/data/mappers/quote_of_the_day_mapper.dart';
import 'package:wonder_words/features/quotes/data/mappers/quotes_mapper.dart';
import 'package:wonder_words/features/quotes/data/source/quotes_api_service.dart';
import 'package:wonder_words/features/quotes/domain/entities/quote_of_the_day_model.dart';
import 'package:wonder_words/features/quotes/domain/entities/quotes_category.dart';
import 'package:wonder_words/features/quotes/domain/entities/quotes_response_model.dart';
import 'package:wonder_words/features/quotes/domain/repository/quotes_repository.dart';

class QuotesRepositoryImpl extends QuotesRepository {
  final QuotesApiService _quotesApiService;
  final log = Logger();

  QuotesRepositoryImpl({required QuotesApiService quotesApiService})
      : _quotesApiService = quotesApiService;

  @override
  Future<Resource<QuotesResponseModel>> getQuotes(
      QuoteCategory category) async {
    try {
      if (category == QuoteCategory.all) {
        final allQuotes = await _quotesApiService.fetchAllQuotes();
        return Success(allQuotes.toQuotesResponseModel());
      }
      final categoryQuotes =
          await _quotesApiService.fetchQuotesByCategory(category.queryParam);
      return Success(categoryQuotes.toQuotesResponseModel());
    } catch (e) {
      log.d("Error in Quotes Repository: $e");
      return Error(e.toString());
    }
  }

  @override
  Future<QuoteOfTheDayModel?> getQuoteOfTheDay() async {
    try {
      final qotdRes = await _quotesApiService.fetchQuoteOfTheDay();
      return qotdRes.toQuoteOfTheDayModel();
    } catch (e) {
      log.d("Error in Quotes Repository --- Getting quote of the day: $e");
      return null;
    }
  }
}
