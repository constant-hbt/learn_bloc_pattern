import 'package:bloc_pattern/src/shared/routes/routes.dart';
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
      providers: [...AppRoutePages.allBlocProviders()],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRouteNames.WELCOME,
        onGenerateRoute: AppRoutePages.generateRouteSettings,
      ),
    );
  }
}
