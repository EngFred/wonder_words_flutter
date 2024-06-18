import 'package:json_annotation/json_annotation.dart';

part 'remote_quotes_response.g.dart';

@JsonSerializable()
class RemoteQuotesResponse {
  final int page;
  @JsonKey(name: "last_page")
  final bool lastPage;
  final List<RemoteQuote> quotes;

  RemoteQuotesResponse({
    required this.page,
    required this.lastPage,
    required this.quotes,
  });

  factory RemoteQuotesResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoteQuotesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteQuotesResponseToJson(this);
}

@JsonSerializable()
class RemoteQuote {
  final int id;
  final bool? dialogue;
  final bool? private;
  final List<String>? tags;
  final String? url;
  @JsonKey(name: "favorites_count")
  final int? favoritesCount;
  @JsonKey(name: "upvotes_count")
  final int? upvotesCount;
  @JsonKey(name: "downvotes_count")
  final int? downvotesCount;
  final String? author;
  @JsonKey(name: "author_permalink")
  final String? authorPermalink;
  final String? body;

  RemoteQuote({
    required this.id,
    this.dialogue,
    this.private,
    this.tags,
    this.url,
    this.favoritesCount,
    this.upvotesCount,
    this.downvotesCount,
    this.author,
    this.authorPermalink,
    this.body,
  });

  factory RemoteQuote.fromJson(Map<String, dynamic> json) =>
      _$RemoteQuoteFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteQuoteToJson(this);
}
