part of 'user_bloc.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserEntity userInfo;

  UserSuccess({required this.userInfo});
}

class UserError extends UserState {
  final String err;

  UserError({required this.err});
}
