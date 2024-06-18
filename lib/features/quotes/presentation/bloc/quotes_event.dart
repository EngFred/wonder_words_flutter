import 'package:wonder_words/features/quotes/domain/entities/quotes_category.dart';

abstract class QuotesEvent {}

class FetchQuotes extends QuotesEvent {
  final QuoteCategory category;

  FetchQuotes({required this.category});
}

class GetQuoteOfTheDay extends QuotesEvent {}
