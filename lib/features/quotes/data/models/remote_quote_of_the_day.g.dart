// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_quote_of_the_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteQuoteOfTheDay _$RemoteQuoteOfTheDayFromJson(Map<String, dynamic> json) =>
    RemoteQuoteOfTheDay(
      qotdDate: json['qotd_date'] as String,
      quote: RemoteQuote.fromJson(json['quote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteQuoteOfTheDayToJson(
        RemoteQuoteOfTheDay instance) =>
    <String, dynamic>{
      'qotd_date': instance.qotdDate,
      'quote': instance.quote,
    };
