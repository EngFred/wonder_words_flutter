import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wonder_words/core/navigation/routes_generator.dart';
import 'package:wonder_words/core/theme/bloc/theme_block.dart';
import 'package:wonder_words/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wonder_words/features/details/presentation/bloc/quote_detail_bloc.dart';
import 'package:wonder_words/features/profile/presentation/bloc/user_bloc.dart';
import 'package:wonder_words/injection_container.dart';

import 'features/quotes/presentation/bloc/quotes_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final userToken = await initializeDeps();

  final initialRoute =
      userToken == null ? RoutesGenerator.loginPage : RoutesGenerator.homePage;

  runApp(WonderWordsApp(
    initialRoute: initialRoute,
  ));
}

class WonderWordsApp extends StatelessWidget {
  final String initialRoute;
  const WonderWordsApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc(),
        ),
        BlocProvider(create: (_) => sl<AuthBloc>()),
        BlocProvider(create: (_) => sl<QuotesBloc>()),
        BlocProvider(create: (_) => sl<QuoteDetailBloc>()),
        BlocProvider(create: (_) => sl<UserBloc>())
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            onGenerateTitle: (context) => "Wonder words",
            initialRoute: initialRoute,
            onGenerateRoute: RoutesGenerator.generateRoute,
            theme: state,
          );
        },
      ),
    );
  }
}
