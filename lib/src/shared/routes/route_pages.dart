import 'package:bloc_pattern/src/pages/welcome/blocs/welcome_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/src/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_pattern/src/shared/routes/routes.dart';

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity(
    this.route,
    this.page, {
    this.bloc,
  });
}

class AppRoutePages {
  static List<PageEntity> getRoutePages() => [
        PageEntity(
          AppRouteNames.WELCOME,
          const WelcomePage(),
          bloc: BlocProvider(create: (context) => WelcomeBloc()),
        ),
        PageEntity(
          AppRouteNames.SIGN_IN,
          const SignInPage(),
        ),
        PageEntity(
          AppRouteNames.REGISTER,
          const RegisterPage(),
        ),
        PageEntity(
          AppRouteNames.APPLICATION,
          const ApplicationPage(),
        ),
      ];

  //Retorna todos os Bloc Providers
  static List<dynamic> allBlocProviders() {
    List<dynamic> blocProviders = [];
    for (var pageEntity in getRoutePages()) {
      if (pageEntity.bloc != null) {
        if (pageEntity.bloc is List<dynamic>) {
          blocProviders.addAll(pageEntity.bloc as List<dynamic>);
        } else {
          blocProviders.add(pageEntity.bloc);
        }
      }
    }

    return blocProviders;
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null && settings.name!.isNotEmpty) {
      final result =
          getRoutePages().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
            builder: (context) => result.first.page, settings: settings);
      }
    }

    return MaterialPageRoute(
        builder: (context) => const SignInPage(), settings: settings);
  }
}
