// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_quotes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteQuotesResponse _$RemoteQuotesResponseFromJson(
        Map<String, dynamic> json) =>
    RemoteQuotesResponse(
      page: (json['page'] as num).toInt(),
      lastPage: json['last_page'] as bool,
      quotes: (json['quotes'] as List<dynamic>)
          .map((e) => RemoteQuote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteQuotesResponseToJson(
        RemoteQuotesResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'last_page': instance.lastPage,
      'quotes': instance.quotes,
    };

RemoteQuote _$RemoteQuoteFromJson(Map<String, dynamic> json) => RemoteQuote(
      id: (json['id'] as num).toInt(),
      dialogue: json['dialogue'] as bool?,
      private: json['private'] as bool?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      url: json['url'] as String?,
      favoritesCount: (json['favorites_count'] as num?)?.toInt(),
      upvotesCount: (json['upvotes_count'] as num?)?.toInt(),
      downvotesCount: (json['downvotes_count'] as num?)?.toInt(),
      author: json['author'] as String?,
      authorPermalink: json['author_permalink'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$RemoteQuoteToJson(RemoteQuote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dialogue': instance.dialogue,
      'private': instance.private,
      'tags': instance.tags,
      'url': instance.url,
      'favorites_count': instance.favoritesCount,
      'upvotes_count': instance.upvotesCount,
      'downvotes_count': instance.downvotesCount,
      'author': instance.author,
      'author_permalink': instance.authorPermalink,
      'body': instance.body,
    };
