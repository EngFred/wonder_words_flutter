import 'package:wonder_words/features/quotes/domain/entities/quotes_response_model.dart';

class QuoteOfTheDayModel {
  final String qotdDate;
  final QuoteModel quote;

  QuoteOfTheDayModel({
    required this.qotdDate,
    required this.quote,
  });
}
