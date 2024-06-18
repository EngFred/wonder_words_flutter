// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_quote_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteQuoteDetails _$RemoteQuoteDetailsFromJson(Map<String, dynamic> json) =>
    RemoteQuoteDetails(
      id: (json['id'] as num).toInt(),
      dialogue: json['dialogue'] as bool?,
      private: json['private'] as bool?,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String?,
      favoritesCount: (json['favorites_count'] as num).toInt(),
      upvotesCount: (json['upvotes_count'] as num).toInt(),
      downvotesCount: (json['downvotes_count'] as num).toInt(),
      author: json['author'] as String?,
      authorPermalink: json['author_permalink'] as String?,
      body: json['body'] as String?,
      userDetails: RemoteUserDetails.fromJson(
          json['user_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteQuoteDetailsToJson(RemoteQuoteDetails instance) =>
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
      'user_details': instance.userDetails,
    };

RemoteUserDetails _$RemoteUserDetailsFromJson(Map<String, dynamic> json) =>
    RemoteUserDetails(
      favorite: json['favorite'] as bool,
      upvote: json['upvote'] as bool,
      downvote: json['downvote'] as bool,
      hidden: json['hidden'] as bool,
    );

Map<String, dynamic> _$RemoteUserDetailsToJson(RemoteUserDetails instance) =>
    <String, dynamic>{
      'favorite': instance.favorite,
      'upvote': instance.upvote,
      'downvote': instance.downvote,
      'hidden': instance.hidden,
    };
