import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_detail_model.freezed.dart';

@freezed
class QuoteDetailsModel with _$QuoteDetailsModel {
  const factory QuoteDetailsModel({
    required int id,
    String? url,
    required int favoritesCount,
    required int upvotesCount,
    required int downvotesCount,
    String? author,
    String? body,
    required UserDetailsModel userDetails,
  }) = _QuoteDetailsModel;
}

@freezed
class UserDetailsModel with _$UserDetailsModel {
  const factory UserDetailsModel({
    required bool favorite,
    required bool upvote,
    required bool downvote,
    required bool hidden,
  }) = _UserDetailsModel;
}
