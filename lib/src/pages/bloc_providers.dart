import 'package:bloc_pattern/src/pages/welcome/blocs/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get blocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
      ];
}
