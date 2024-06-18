import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wonder_words/features/auth/data/repository/auth_repository_impl.dart';
import 'package:wonder_words/features/auth/data/source/auth_api_service.dart';
import 'package:wonder_words/features/auth/domain/repository/auth_repository.dart';
import 'package:wonder_words/features/auth/domain/usecases/create_user_session_usecase.dart';
import 'package:wonder_words/features/auth/domain/usecases/create_user_usecase.dart';
import 'package:wonder_words/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wonder_words/features/auth/utils/shared_preferences_helper.dart';
import 'package:wonder_words/features/details/data/source/quote_detail_api_service.dart';
import 'package:wonder_words/features/details/domain/repository/quote_detail_repository.dart';
import 'package:wonder_words/features/details/domain/usecases/downvote_quote_usecase.dart';
import 'package:wonder_words/features/details/domain/usecases/fav_quote_usecase.dart';
import 'package:wonder_words/features/details/domain/usecases/get_quote_details_usecase.dart';
import 'package:wonder_words/features/details/domain/usecases/unfav_quote_usecase.dart';
import 'package:wonder_words/features/details/domain/usecases/upvote_quote_usecase.dart';
import 'package:wonder_words/features/profile/data/repository/user_detail_repository_impl.dart';
import 'package:wonder_words/features/profile/domain/repository/user_detail_repository.dart';
import 'package:wonder_words/features/profile/domain/usecases/get_user_detail_usecase.dart';
import 'package:wonder_words/features/profile/presentation/bloc/user_bloc.dart';
import 'package:wonder_words/features/quotes/data/repository/quotes_repository_impl.dart';
import 'package:wonder_words/features/quotes/data/source/quotes_api_service.dart';
import 'package:wonder_words/features/quotes/domain/repository/quotes_repository.dart';
import 'package:wonder_words/features/quotes/domain/usecases/fetch_quotes_usecase.dart';
import 'package:wonder_words/features/quotes/domain/usecases/get_quote_of_the_day_usecase.dart';
import 'package:wonder_words/features/quotes/presentation/bloc/quotes_bloc.dart';

import 'features/details/data/repository/quote_detail_repository_impl.dart';
import 'features/details/presentation/bloc/quote_detail_bloc.dart';
import 'features/profile/data/source/user_detail_service.dart';

final sl = GetIt.instance;

Future<String?> initializeDeps() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton(() => SharedPreferencesHelper(prefs: sl()));

  final userToken = await sl<SharedPreferencesHelper>().getUserToken();
  final userName = await sl<SharedPreferencesHelper>().getUserName();

  //auth
  sl.registerLazySingleton<Dio>(() => setupDioForAuth(),
      instanceName: 'authDio');

  sl.registerLazySingleton<AuthApiService>(
      () => AuthApiService(sl(instanceName: 'authDio')));

  sl.registerLazySingleton<AuthRepository>(() =>
      AuthRepositoryImpl(authApiService: sl(), sharedPreferencesHelper: sl()));

  sl.registerLazySingleton(() => CreateUserUsecase(authRepository: sl()));
  sl.registerLazySingleton(
      () => CreateUserSessionUsecase(authRepository: sl()));

  sl.registerLazySingleton<AuthBloc>(
      () => AuthBloc(createUserUsecase: sl(), createUserSessionUsecase: sl()));

  //quotes
  if (userToken != null) {
    sl.registerLazySingleton<Dio>(() => setupDioForQuotes(userToken),
        instanceName: 'quotesDio');

    sl.registerLazySingleton<QuotesApiService>(
        () => QuotesApiService(sl(instanceName: 'quotesDio')));

    sl.registerLazySingleton<QuotesRepository>(
        () => QuotesRepositoryImpl(quotesApiService: sl()));

    sl.registerLazySingleton(() => FetchQuotesUsecase(quotesRepository: sl()));

    sl.registerLazySingleton(
        () => GetQuoteOfTheDayUsecase(quotesRepository: sl()));

    sl.registerLazySingleton<QuotesBloc>(() => QuotesBloc(sl()));

    //quote_details
    sl.registerLazySingleton<Dio>(() => setupDioForQuoteDetails(userToken),
        instanceName: 'quoteDetailsDio');

    sl.registerLazySingleton<QuoteDetailApiService>(
        () => QuoteDetailApiService(sl(instanceName: 'quoteDetailsDio')));

    sl.registerLazySingleton<QuoteDetailRepository>(
        () => QuoteDetailReposiotryImpl(quoteDetailApiService: sl()));

    sl.registerLazySingleton(
        () => GetQuoteDetailsUsecase(quoteDetailsRepository: sl()));

    sl.registerLazySingleton(
        () => FavQuoteUsecase(quoteDetailRepository: sl()));

    sl.registerLazySingleton(
        () => UnFavQuoteUsecase(quoteDetailRepository: sl()));

    sl.registerLazySingleton(
        () => UpvoteQuoteUsecase(quoteDetailRepository: sl()));

    sl.registerLazySingleton(
        () => DownvoteQuoteUsecase(quoteDetailRepository: sl()));

    sl.registerLazySingleton<QuoteDetailBloc>(
        () => QuoteDetailBloc(sl(), sl(), sl(), sl(), sl()));

    //user

    sl.registerLazySingleton<Dio>(() => setupDioForUserInfo(userToken),
        instanceName: 'userInfoDio');

    sl.registerLazySingleton<UserDetailService>(
        () => UserDetailService(sl(instanceName: 'userInfoDio')));

    sl.registerLazySingleton<UserDetailRepository>(
        () => UserDetailRepositoryImpl(userDetailService: sl()));

    sl.registerLazySingleton(
        () => GetUserDetailUsecase(userDetailRepository: sl()));

    sl.registerLazySingleton<UserBloc>(() => UserBloc(sl(), userName));
  }

  return userToken;
}
