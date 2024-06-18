import 'package:wonder_words/features/details/data/models/remote_quote_detail.dart';
import 'package:wonder_words/features/details/domain/entities/quote_detail_model.dart';

extension RemoteQuoteDetailsExtension on RemoteQuoteDetails {
  QuoteDetailsModel toQuoteDetailsModel() {
    return QuoteDetailsModel(
        id: id,
        favoritesCount: favoritesCount,
        upvotesCount: upvotesCount,
        downvotesCount: downvotesCount,
        author: author,
        body: body,
        url: url,
        userDetails: userDetails.toUserDetailsModel());
  }
}

extension RemoteUserDetailsExtension on RemoteUserDetails {
  UserDetailsModel toUserDetailsModel() {
    return UserDetailsModel(
        favorite: favorite, upvote: upvote, downvote: downvote, hidden: hidden);
  }
}
