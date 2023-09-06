import 'package:bloc_pattern/src/pages/bloc_providers.dart';
import 'package:bloc_pattern/src/pages/welcome/welcome_page.dart';
import 'package:bloc_pattern/src/routes.dart';
import 'package:bloc_pattern/src/shared/themes/app_theme.dart';
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
      providers: AppBlocProviders.blocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const WelcomePage(),
        initialRoute: "/welcome",
        routes: Routes.routes(context),
      ),
    );
  }
}
