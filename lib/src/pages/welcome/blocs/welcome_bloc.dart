import 'package:bloc_pattern/src/pages/welcome/blocs/welcome_events.dart';
import 'package:bloc_pattern/src/pages/welcome/blocs/welcome_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) => emit(WelcomeState(page: event.page)));
  }
}
