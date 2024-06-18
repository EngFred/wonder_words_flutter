import 'package:json_annotation/json_annotation.dart';

part 'remote_quote_detail.g.dart';

@JsonSerializable()
class RemoteQuoteDetails {
  final int id;
  final bool? dialogue;
  final bool? private;
  final List<String> tags;
  final String? url;
  @JsonKey(name: "favorites_count")
  final int favoritesCount;
  @JsonKey(name: "upvotes_count")
  final int upvotesCount;
  @JsonKey(name: "downvotes_count")
  final int downvotesCount;
  final String? author;
  @JsonKey(name: "author_permalink")
  final String? authorPermalink;
  final String? body;
  @JsonKey(name: "user_details")
  final RemoteUserDetails userDetails;

  RemoteQuoteDetails({
    required this.id,
    this.dialogue,
    this.private,
    required this.tags,
    this.url,
    required this.favoritesCount,
    required this.upvotesCount,
    required this.downvotesCount,
    this.author,
    this.authorPermalink,
    this.body,
    required this.userDetails,
  });

  factory RemoteQuoteDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteQuoteDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteQuoteDetailsToJson(this);
}

@JsonSerializable()
class RemoteUserDetails {
  final bool favorite;
  final bool upvote;
  final bool downvote;
  final bool hidden;

  RemoteUserDetails({
    required this.favorite,
    required this.upvote,
    required this.downvote,
    required this.hidden,
  });

  factory RemoteUserDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserDetailsToJson(this);
}
