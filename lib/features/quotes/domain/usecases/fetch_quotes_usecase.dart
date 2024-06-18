import 'package:wonder_words/core/resource/resource.dart';
import 'package:wonder_words/core/usecase/base_usecase.dart';
import 'package:wonder_words/features/quotes/domain/entities/quotes_category.dart';
import 'package:wonder_words/features/quotes/domain/entities/quotes_response_model.dart';
import 'package:wonder_words/features/quotes/domain/repository/quotes_repository.dart';

class FetchQuotesUsecase
    extends BaseUsecase<Resource<QuotesResponseModel>, QuoteCategory> {
  final QuotesRepository _quotesRepository;

  FetchQuotesUsecase({required QuotesRepository quotesRepository})
      : _quotesRepository = quotesRepository;

  @override
  Future<Resource<QuotesResponseModel>> call(
      {required QuoteCategory params}) async {
    final quotes = await _quotesRepository.getQuotes(params);
    return quotes;
  }
}
