// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quote_detail_bloc.dart';

abstract class QuoteDetailEvent {}

class FetchedQuoteDetails extends QuoteDetailEvent {
  final int quoteId;

  FetchedQuoteDetails({required this.quoteId});
}

class UpvoteQuote extends QuoteDetailEvent {
  final int quoteId;

  UpvoteQuote({required this.quoteId});
}

class DownvoteQuote extends QuoteDetailEvent {
  final int quoteId;

  DownvoteQuote({required this.quoteId});
}

class FavQuote extends QuoteDetailEvent {
  final int quoteId;

  FavQuote({required this.quoteId});
}

class UnfavQuote extends QuoteDetailEvent {
  final int quoteId;

  UnfavQuote({required this.quoteId});
}
