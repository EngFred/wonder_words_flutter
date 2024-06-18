import 'package:wonder_words/features/quotes/data/models/remote_quotes_response.dart';
import 'package:wonder_words/features/quotes/domain/entities/quotes_response_model.dart';

extension QuotesResponseExtension on RemoteQuotesResponse {
  QuotesResponseModel toQuotesResponseModel() {
    return QuotesResponseModel(
        page: page, lastPage: lastPage, quotes: quotes.toQuoteModelsList());
  }
}

extension QuotesExtension on RemoteQuote {
  QuoteModel toQuoteModel() {
    return QuoteModel(id: id, author: author, body: body);
  }
}

extension QuotesListExtention on List<RemoteQuote> {
  List<QuoteModel> toQuoteModelsList() {
    return map((remoteQuote) => remoteQuote.toQuoteModel()).toList();
  }
}
