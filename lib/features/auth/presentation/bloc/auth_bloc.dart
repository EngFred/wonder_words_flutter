import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wonder_words/core/resource/resource.dart';
import 'package:wonder_words/features/auth/data/models/request_bodies/new_user.dart';
import 'package:wonder_words/features/auth/data/models/request_bodies/user_session.dart';
import 'package:wonder_words/features/auth/domain/usecases/create_user_session_usecase.dart';
import 'package:wonder_words/features/auth/domain/usecases/create_user_usecase.dart';
import 'package:wonder_words/features/auth/presentation/bloc/auth_events.dart';
import 'package:wonder_words/features/auth/presentation/bloc/auth_state.dart';
import 'package:wonder_words/features/auth/utils/shared_preferences_helper.dart';
import 'package:wonder_words/injection_container.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  final CreateUserUsecase createUserUsecase;
  final CreateUserSessionUsecase createUserSessionUsecase;
  final SharedPreferencesHelper sharedPreferencesHelper;
  AuthBloc(
      {required this.createUserSessionUsecase,
      required this.createUserUsecase,
      required this.sharedPreferencesHelper})
      : super(AuthInitial()) {
    on<LoginButtonClicked>(_onLoginButtonClicked);
    on<SignupButtonClicked>(_onSignupButtonClicked);
  }

  bool _isAuthenticating = false;
  bool get isAuthenticating => _isAuthenticating;

  Future<void> _onLoginButtonClicked(
      LoginButtonClicked event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final userSession =
          UserSession(login: event.login, password: event.password);
      final userSessionRequest = UserSessionRequest(user: userSession);
      final apiResponse =
          await createUserSessionUsecase(params: userSessionRequest);
      if (apiResponse is Success) {
        final userToken = await sharedPreferencesHelper.getUserToken();
        final userName = await sharedPreferencesHelper.getUserName();
        initDepsWithUserToken(userToken!, userName!);
        emit(AuthSuccess());
      } else {
        emit(AuthError(errorMessage: apiResponse.error!));
      }
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  Future<void> _onSignupButtonClicked(
      SignupButtonClicked event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = NewUser(
          login: event.username, email: event.email, password: event.password);
      final userRequest = NewUserRequest(user: user);
      var apiResponse = await createUserUsecase(params: userRequest);
      if (apiResponse is Success) {
        final userToken = await sharedPreferencesHelper.getUserToken();
        final userName = await sharedPreferencesHelper.getUserName();
        initDepsWithUserToken(userToken!, userName!);
        emit(AuthSuccess());
      } else {
        emit(AuthError(errorMessage: apiResponse.error!));
      }
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }
}
