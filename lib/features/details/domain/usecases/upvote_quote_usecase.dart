import '../../../../core/usecase/base_usecase.dart';
import '../entities/quote_detail_model.dart';
import '../repository/quote_detail_repository.dart';

class UpvoteQuoteUsecase extends BaseUsecase<QuoteDetailsModel?, int> {
  final QuoteDetailRepository _quoteDetailRepository;

  UpvoteQuoteUsecase({required QuoteDetailRepository quoteDetailRepository})
      : _quoteDetailRepository = quoteDetailRepository;

  @override
  Future<QuoteDetailsModel?> call({required int params}) async {
    final res = await _quoteDetailRepository.downvoteQuote(params);
    return res;
  }
}
