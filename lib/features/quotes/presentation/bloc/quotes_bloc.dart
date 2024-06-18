import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:wonder_words/core/resource/resource.dart';
import 'package:wonder_words/features/quotes/domain/usecases/fetch_quotes_usecase.dart';
import 'package:wonder_words/features/quotes/presentation/bloc/quotes_event.dart';
import 'package:wonder_words/features/quotes/presentation/bloc/quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  final FetchQuotesUsecase fetchQuotesUsecase;
  // final GetQuoteOfTheDayUsecase getQuoteOfTheDayUsecase;
  final log = Logger();
  QuotesBloc(this.fetchQuotesUsecase) : super(QuotesInitial()) {
    on<FetchQuotes>(_fetchQuotes);
    // on<GetQuoteOfTheDay>(_getQuoteOfTheDay);
  }

  Future<void> _fetchQuotes(
      FetchQuotes event, Emitter<QuotesState> emit) async {
    emit(QuotesLoading());
    try {
      final quotesResponse = await fetchQuotesUsecase(params: event.category);

      if (quotesResponse is Success) {
        emit(QuotesSuccess(quotesResponseModel: quotesResponse.data!));
      } else {
        emit(QuotesError(errMsg: quotesResponse.error!));
      }
    } catch (e) {
      log.d("ERROR in quotes bloc : $e");
      emit(QuotesError(errMsg: e.toString()));
    }
  }

  // Future<void> _getQuoteOfTheDay(
  //     GetQuoteOfTheDay event, Emitter<QuotesState> emit) async {
  //   try {
  //     final dhsbh = await getQuoteOfTheDayUsecase(params: null);
  //   } catch (e) {
  //     log.d("ERROR in quotes bloc ---getting quote of the day: $e");
  //     emit(QuotesError(errMsg: e.toString()));
  //   }
  // }
}
