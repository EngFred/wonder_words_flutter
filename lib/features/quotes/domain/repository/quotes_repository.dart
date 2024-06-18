import 'package:wonder_words/features/quotes/domain/entities/quotes_category.dart';
import 'package:wonder_words/features/quotes/domain/entities/quotes_response_model.dart';

import '../../../../core/resource/resource.dart';
import '../entities/quote_of_the_day_model.dart';

abstract class QuotesRepository {
  Future<Resource<QuotesResponseModel>> getQuotes(QuoteCategory category);
  Future<QuoteOfTheDayModel?> getQuoteOfTheDay();
}
