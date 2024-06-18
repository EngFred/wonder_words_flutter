import 'package:wonder_words/core/usecase/base_usecase.dart';
import 'package:wonder_words/features/quotes/domain/entities/quote_of_the_day_model.dart';
import 'package:wonder_words/features/quotes/domain/repository/quotes_repository.dart';

class GetQuoteOfTheDayUsecase extends BaseUsecase<QuoteOfTheDayModel?, Null> {
  final QuotesRepository _quotesRepository;

  GetQuoteOfTheDayUsecase({required QuotesRepository quotesRepository})
      : _quotesRepository = quotesRepository;

  @override
  Future<QuoteOfTheDayModel?> call({required params}) async {
    final qotdRes = await _quotesRepository.getQuoteOfTheDay();
    return qotdRes;
  }
}
