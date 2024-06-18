import 'package:wonder_words/features/quotes/domain/entities/quotes_response_model.dart';

abstract class QuotesState {}

class QuotesInitial extends QuotesState {}

class QuotesLoading extends QuotesState {}

class QuotesSuccess extends QuotesState {
  final QuotesResponseModel quotesResponseModel;

  QuotesSuccess({required this.quotesResponseModel});
}

class QuotesError extends QuotesState {
  final String errMsg;

  QuotesError({required this.errMsg});
}
