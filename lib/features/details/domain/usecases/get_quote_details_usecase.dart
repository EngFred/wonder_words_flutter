import 'package:wonder_words/core/usecase/base_usecase.dart';
import 'package:wonder_words/features/details/domain/entities/quote_detail_model.dart';

import '../repository/quote_detail_repository.dart';

class GetQuoteDetailsUsecase extends StreamBaseUsecase<QuoteDetailsModel, int> {
  final QuoteDetailRepository _quoteDetailsRepository;

  GetQuoteDetailsUsecase(
      {required QuoteDetailRepository quoteDetailsRepository})
      : _quoteDetailsRepository = quoteDetailsRepository;

  @override
  Stream<QuoteDetailsModel> call({required int params}) {
    return _quoteDetailsRepository.fetchQuoteDetails(params);
  }
}
