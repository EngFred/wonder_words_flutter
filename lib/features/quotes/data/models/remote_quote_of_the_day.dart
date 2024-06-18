import 'package:json_annotation/json_annotation.dart';

import 'remote_quotes_response.dart';

part 'remote_quote_of_the_day.g.dart';

@JsonSerializable()
class RemoteQuoteOfTheDay {
  @JsonKey(name: "qotd_date")
  final String qotdDate;
  final RemoteQuote quote;

  RemoteQuoteOfTheDay({
    required this.qotdDate,
    required this.quote,
  });

  factory RemoteQuoteOfTheDay.fromJson(Map<String, dynamic> json) =>
      _$RemoteQuoteOfTheDayFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteQuoteOfTheDayToJson(this);
}
