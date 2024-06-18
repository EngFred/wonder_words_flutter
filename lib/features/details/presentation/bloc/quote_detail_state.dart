part of 'quote_detail_bloc.dart';

abstract class QuoteDetailState {}

class QuoteDetailsInitial extends QuoteDetailState {}

class QuoteDetailsLoading extends QuoteDetailState {}

class QuoteDetailsSuccess extends QuoteDetailState {
  final QuoteDetailsModel? quoteDetailsModel;

  QuoteDetailsSuccess({required this.quoteDetailsModel});
}

class QuoteDetailsError extends QuoteDetailState {
  final String errorMsg;

  QuoteDetailsError({required this.errorMsg});
}
