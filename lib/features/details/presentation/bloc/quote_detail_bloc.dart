import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';
import 'package:wonder_words/features/details/domain/entities/quote_detail_model.dart';
import 'package:wonder_words/features/details/domain/usecases/downvote_quote_usecase.dart';
import 'package:wonder_words/features/details/domain/usecases/get_quote_details_usecase.dart';

import '../../domain/usecases/fav_quote_usecase.dart';
import '../../domain/usecases/unfav_quote_usecase.dart';
import '../../domain/usecases/upvote_quote_usecase.dart';

part 'quote_detail_event.dart';
part 'quote_detail_state.dart';

class QuoteDetailBloc extends Bloc<QuoteDetailEvent, QuoteDetailState> {
  final GetQuoteDetailsUsecase _getQuoteDetailsUsecase;
  final UpvoteQuoteUsecase _upvoteQuoteUseCase;
  final DownvoteQuoteUsecase _downvoteQuoteUseCase;
  final FavQuoteUsecase _favQuoteUseCase;
  final UnFavQuoteUsecase __unfavQuoteUseCase;
  final log = Logger();
  QuoteDetailBloc(
      this._getQuoteDetailsUsecase,
      this._upvoteQuoteUseCase,
      this._downvoteQuoteUseCase,
      this._favQuoteUseCase,
      this.__unfavQuoteUseCase)
      : super(QuoteDetailsInitial()) {
    on<FetchedQuoteDetails>(_fetchQuoteDetails);
    on<UpvoteQuote>(_upvoteQuote);
    on<DownvoteQuote>(_downvoteQuote);
    on<FavQuote>(_favQuote);
    on<UnfavQuote>(_unfavQuote);
  }

  void _fetchQuoteDetails(
      FetchedQuoteDetails event, Emitter<QuoteDetailState> emit) async {
    emit(QuoteDetailsLoading());
    try {
      final stream = _getQuoteDetailsUsecase(params: event.quoteId);

      await emit.forEach<QuoteDetailsModel>(stream,
          onData: (quoteDetails) =>
              QuoteDetailsSuccess(quoteDetailsModel: quoteDetails),
          onError: (_, __) =>
              QuoteDetailsError(errorMsg: "Failed to fetch quote details!"));
    } catch (e) {
      log.d("Error in the Quote Detail Bloc: $e");
      emit(QuoteDetailsError(errorMsg: "$e"));
    }
  }

  void _upvoteQuote(UpvoteQuote event, Emitter<QuoteDetailState> emit) async {
    try {
      final updatedQuote = await _upvoteQuoteUseCase(params: event.quoteId);
      if (updatedQuote != null) {
        emit(QuoteDetailsSuccess(quoteDetailsModel: updatedQuote));
      }
    } catch (_) {
      log.d("Failed to upvote quote");
      // emit(QuoteDetailsError(errorMsg: "Failed to upvote quote"));
    }
  }

  void _downvoteQuote(
      DownvoteQuote event, Emitter<QuoteDetailState> emit) async {
    try {
      final updatedQuote = await _downvoteQuoteUseCase(params: event.quoteId);
      if (updatedQuote != null) {
        emit(QuoteDetailsSuccess(quoteDetailsModel: updatedQuote));
      }
    } catch (_) {
      log.d("Failed to downvote quote");
    }
  }

  void _favQuote(FavQuote event, Emitter<QuoteDetailState> emit) async {
    try {
      final updatedQuote = await _favQuoteUseCase(params: event.quoteId);
      if (updatedQuote != null) {
        emit(QuoteDetailsSuccess(quoteDetailsModel: updatedQuote));
      }
    } catch (_) {
      log.d("Failed to favorite quote");
    }
  }

  void _unfavQuote(UnfavQuote event, Emitter<QuoteDetailState> emit) async {
    try {
      final updatedQuote = await __unfavQuoteUseCase(params: event.quoteId);
      if (updatedQuote != null) {
        emit(QuoteDetailsSuccess(quoteDetailsModel: updatedQuote));
      }
    } catch (_) {
      log.d("Failed to unfavorite quote");
    }
  }
}
