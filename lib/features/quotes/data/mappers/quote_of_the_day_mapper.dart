import 'package:wonder_words/features/quotes/data/mappers/quotes_mapper.dart';
import 'package:wonder_words/features/quotes/data/models/remote_quote_of_the_day.dart';
import 'package:wonder_words/features/quotes/domain/entities/quote_of_the_day_model.dart';

extension RemoteQuoteOfTheDayExtension on RemoteQuoteOfTheDay {
  QuoteOfTheDayModel toQuoteOfTheDayModel() {
    return QuoteOfTheDayModel(qotdDate: qotdDate, quote: quote.toQuoteModel());
  }
}
