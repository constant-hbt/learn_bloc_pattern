import 'package:bloc_pattern/src/pages/welcome/blocs/welcome_bloc.dart';
import 'package:bloc_pattern/src/pages/welcome/welcome_page.dart';
import 'package:bloc_pattern/src/shared/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        home: const WelcomePage(),
      ),
    );
  }
}
