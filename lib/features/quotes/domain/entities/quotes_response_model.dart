class QuotesResponseModel {
  final int page;
  final bool lastPage;
  final List<QuoteModel> quotes;

  QuotesResponseModel({
    required this.page,
    required this.lastPage,
    required this.quotes,
  });
}

class QuoteModel {
  final int id;
  final String? author;
  final String? body;

  QuoteModel({required this.id, this.author, this.body});
}
