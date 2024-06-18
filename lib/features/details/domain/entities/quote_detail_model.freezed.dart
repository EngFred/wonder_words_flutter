// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuoteDetailsModel {
  int get id => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  int get favoritesCount => throw _privateConstructorUsedError;
  int get upvotesCount => throw _privateConstructorUsedError;
  int get downvotesCount => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  UserDetailsModel get userDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuoteDetailsModelCopyWith<QuoteDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteDetailsModelCopyWith<$Res> {
  factory $QuoteDetailsModelCopyWith(
          QuoteDetailsModel value, $Res Function(QuoteDetailsModel) then) =
      _$QuoteDetailsModelCopyWithImpl<$Res, QuoteDetailsModel>;
  @useResult
  $Res call(
      {int id,
      String? url,
      int favoritesCount,
      int upvotesCount,
      int downvotesCount,
      String? author,
      String? body,
      UserDetailsModel userDetails});

  $UserDetailsModelCopyWith<$Res> get userDetails;
}

/// @nodoc
class _$QuoteDetailsModelCopyWithImpl<$Res, $Val extends QuoteDetailsModel>
    implements $QuoteDetailsModelCopyWith<$Res> {
  _$QuoteDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = freezed,
    Object? favoritesCount = null,
    Object? upvotesCount = null,
    Object? downvotesCount = null,
    Object? author = freezed,
    Object? body = freezed,
    Object? userDetails = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      favoritesCount: null == favoritesCount
          ? _value.favoritesCount
          : favoritesCount // ignore: cast_nullable_to_non_nullable
              as int,
      upvotesCount: null == upvotesCount
          ? _value.upvotesCount
          : upvotesCount // ignore: cast_nullable_to_non_nullable
              as int,
      downvotesCount: null == downvotesCount
          ? _value.downvotesCount
          : downvotesCount // ignore: cast_nullable_to_non_nullable
              as int,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetailsModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDetailsModelCopyWith<$Res> get userDetails {
    return $UserDetailsModelCopyWith<$Res>(_value.userDetails, (value) {
      return _then(_value.copyWith(userDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuoteDetailsModelImplCopyWith<$Res>
    implements $QuoteDetailsModelCopyWith<$Res> {
  factory _$$QuoteDetailsModelImplCopyWith(_$QuoteDetailsModelImpl value,
          $Res Function(_$QuoteDetailsModelImpl) then) =
      __$$QuoteDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? url,
      int favoritesCount,
      int upvotesCount,
      int downvotesCount,
      String? author,
      String? body,
      UserDetailsModel userDetails});

  @override
  $UserDetailsModelCopyWith<$Res> get userDetails;
}

/// @nodoc
class __$$QuoteDetailsModelImplCopyWithImpl<$Res>
    extends _$QuoteDetailsModelCopyWithImpl<$Res, _$QuoteDetailsModelImpl>
    implements _$$QuoteDetailsModelImplCopyWith<$Res> {
  __$$QuoteDetailsModelImplCopyWithImpl(_$QuoteDetailsModelImpl _value,
      $Res Function(_$QuoteDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = freezed,
    Object? favoritesCount = null,
    Object? upvotesCount = null,
    Object? downvotesCount = null,
    Object? author = freezed,
    Object? body = freezed,
    Object? userDetails = null,
  }) {
    return _then(_$QuoteDetailsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      favoritesCount: null == favoritesCount
          ? _value.favoritesCount
          : favoritesCount // ignore: cast_nullable_to_non_nullable
              as int,
      upvotesCount: null == upvotesCount
          ? _value.upvotesCount
          : upvotesCount // ignore: cast_nullable_to_non_nullable
              as int,
      downvotesCount: null == downvotesCount
          ? _value.downvotesCount
          : downvotesCount // ignore: cast_nullable_to_non_nullable
              as int,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetailsModel,
    ));
  }
}

/// @nodoc

class _$QuoteDetailsModelImpl implements _QuoteDetailsModel {
  const _$QuoteDetailsModelImpl(
      {required this.id,
      this.url,
      required this.favoritesCount,
      required this.upvotesCount,
      required this.downvotesCount,
      this.author,
      this.body,
      required this.userDetails});

  @override
  final int id;
  @override
  final String? url;
  @override
  final int favoritesCount;
  @override
  final int upvotesCount;
  @override
  final int downvotesCount;
  @override
  final String? author;
  @override
  final String? body;
  @override
  final UserDetailsModel userDetails;

  @override
  String toString() {
    return 'QuoteDetailsModel(id: $id, url: $url, favoritesCount: $favoritesCount, upvotesCount: $upvotesCount, downvotesCount: $downvotesCount, author: $author, body: $body, userDetails: $userDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuoteDetailsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.favoritesCount, favoritesCount) ||
                other.favoritesCount == favoritesCount) &&
            (identical(other.upvotesCount, upvotesCount) ||
                other.upvotesCount == upvotesCount) &&
            (identical(other.downvotesCount, downvotesCount) ||
                other.downvotesCount == downvotesCount) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, url, favoritesCount,
      upvotesCount, downvotesCount, author, body, userDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteDetailsModelImplCopyWith<_$QuoteDetailsModelImpl> get copyWith =>
      __$$QuoteDetailsModelImplCopyWithImpl<_$QuoteDetailsModelImpl>(
          this, _$identity);
}

abstract class _QuoteDetailsModel implements QuoteDetailsModel {
  const factory _QuoteDetailsModel(
      {required final int id,
      final String? url,
      required final int favoritesCount,
      required final int upvotesCount,
      required final int downvotesCount,
      final String? author,
      final String? body,
      required final UserDetailsModel userDetails}) = _$QuoteDetailsModelImpl;

  @override
  int get id;
  @override
  String? get url;
  @override
  int get favoritesCount;
  @override
  int get upvotesCount;
  @override
  int get downvotesCount;
  @override
  String? get author;
  @override
  String? get body;
  @override
  UserDetailsModel get userDetails;
  @override
  @JsonKey(ignore: true)
  _$$QuoteDetailsModelImplCopyWith<_$QuoteDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserDetailsModel {
  bool get favorite => throw _privateConstructorUsedError;
  bool get upvote => throw _privateConstructorUsedError;
  bool get downvote => throw _privateConstructorUsedError;
  bool get hidden => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDetailsModelCopyWith<UserDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsModelCopyWith<$Res> {
  factory $UserDetailsModelCopyWith(
          UserDetailsModel value, $Res Function(UserDetailsModel) then) =
      _$UserDetailsModelCopyWithImpl<$Res, UserDetailsModel>;
  @useResult
  $Res call({bool favorite, bool upvote, bool downvote, bool hidden});
}

/// @nodoc
class _$UserDetailsModelCopyWithImpl<$Res, $Val extends UserDetailsModel>
    implements $UserDetailsModelCopyWith<$Res> {
  _$UserDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favorite = null,
    Object? upvote = null,
    Object? downvote = null,
    Object? hidden = null,
  }) {
    return _then(_value.copyWith(
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      upvote: null == upvote
          ? _value.upvote
          : upvote // ignore: cast_nullable_to_non_nullable
              as bool,
      downvote: null == downvote
          ? _value.downvote
          : downvote // ignore: cast_nullable_to_non_nullable
              as bool,
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDetailsModelImplCopyWith<$Res>
    implements $UserDetailsModelCopyWith<$Res> {
  factory _$$UserDetailsModelImplCopyWith(_$UserDetailsModelImpl value,
          $Res Function(_$UserDetailsModelImpl) then) =
      __$$UserDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool favorite, bool upvote, bool downvote, bool hidden});
}

/// @nodoc
class __$$UserDetailsModelImplCopyWithImpl<$Res>
    extends _$UserDetailsModelCopyWithImpl<$Res, _$UserDetailsModelImpl>
    implements _$$UserDetailsModelImplCopyWith<$Res> {
  __$$UserDetailsModelImplCopyWithImpl(_$UserDetailsModelImpl _value,
      $Res Function(_$UserDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favorite = null,
    Object? upvote = null,
    Object? downvote = null,
    Object? hidden = null,
  }) {
    return _then(_$UserDetailsModelImpl(
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      upvote: null == upvote
          ? _value.upvote
          : upvote // ignore: cast_nullable_to_non_nullable
              as bool,
      downvote: null == downvote
          ? _value.downvote
          : downvote // ignore: cast_nullable_to_non_nullable
              as bool,
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserDetailsModelImpl implements _UserDetailsModel {
  const _$UserDetailsModelImpl(
      {required this.favorite,
      required this.upvote,
      required this.downvote,
      required this.hidden});

  @override
  final bool favorite;
  @override
  final bool upvote;
  @override
  final bool downvote;
  @override
  final bool hidden;

  @override
  String toString() {
    return 'UserDetailsModel(favorite: $favorite, upvote: $upvote, downvote: $downvote, hidden: $hidden)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailsModelImpl &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.upvote, upvote) || other.upvote == upvote) &&
            (identical(other.downvote, downvote) ||
                other.downvote == downvote) &&
            (identical(other.hidden, hidden) || other.hidden == hidden));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, favorite, upvote, downvote, hidden);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailsModelImplCopyWith<_$UserDetailsModelImpl> get copyWith =>
      __$$UserDetailsModelImplCopyWithImpl<_$UserDetailsModelImpl>(
          this, _$identity);
}

abstract class _UserDetailsModel implements UserDetailsModel {
  const factory _UserDetailsModel(
      {required final bool favorite,
      required final bool upvote,
      required final bool downvote,
      required final bool hidden}) = _$UserDetailsModelImpl;

  @override
  bool get favorite;
  @override
  bool get upvote;
  @override
  bool get downvote;
  @override
  bool get hidden;
  @override
  @JsonKey(ignore: true)
  _$$UserDetailsModelImplCopyWith<_$UserDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
