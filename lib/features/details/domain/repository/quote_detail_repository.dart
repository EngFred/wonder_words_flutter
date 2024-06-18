import 'package:wonder_words/features/details/domain/entities/quote_detail_model.dart';

abstract class QuoteDetailRepository {
  Stream<QuoteDetailsModel> fetchQuoteDetails(int quoteId);
  Future<QuoteDetailsModel?> favQuote(int quoteId);
  Future<QuoteDetailsModel?> unfavQuote(int quoteId);
  Future<QuoteDetailsModel?> upvoteQuote(int quoteId);
  Future<QuoteDetailsModel?> downvoteQuote(int quoteId);
  Future<QuoteDetailsModel?> clearVote(int quoteId);
}
