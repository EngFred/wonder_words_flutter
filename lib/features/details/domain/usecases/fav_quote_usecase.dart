import 'package:wonder_words/core/usecase/base_usecase.dart';
import 'package:wonder_words/features/details/domain/entities/quote_detail_model.dart';
import 'package:wonder_words/features/details/domain/repository/quote_detail_repository.dart';

class FavQuoteUsecase extends BaseUsecase<QuoteDetailsModel?, int> {
  final QuoteDetailRepository _quoteDetailRepository;

  FavQuoteUsecase({required QuoteDetailRepository quoteDetailRepository})
      : _quoteDetailRepository = quoteDetailRepository;

  @override
  Future<QuoteDetailsModel?> call({required int params}) async {
    final res = await _quoteDetailRepository.favQuote(params);
    return res;
  }
}
