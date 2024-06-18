import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:wonder_words/features/profile/domain/entities/user_entity.dart';
import 'package:wonder_words/features/profile/domain/usecases/get_user_detail_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserDetailUsecase _getUserDetailUsecase;
  final String? username;
  final log = Logger();
  UserBloc(this._getUserDetailUsecase, this.username) : super(UserInitial()) {
    on<GetUser>(_getUser);
  }

  void _getUser(GetUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      if (username != null) {
        final stream = _getUserDetailUsecase(params: username!);

        await emit.forEach<UserEntity>(stream,
            onData: (userInfo) => UserSuccess(userInfo: userInfo),
            onError: (_, __) =>
                UserError(err: "Failed to fetch quote details!"));
      } else {
        emit(UserError(err: "Username not found!"));
      }
    } catch (e) {
      log.d("Error in User Bloc: $e");
      emit(UserError(err: "$e"));
    }
  }
}
