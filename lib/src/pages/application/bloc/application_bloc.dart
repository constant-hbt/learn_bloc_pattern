import 'package:bloc_pattern/src/pages/application/bloc/application_events.dart';
import 'package:bloc_pattern/src/pages/application/bloc/application_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState()) {
    on<TriggerApplicationEvent>(
        (event, emit) => emit(state.copyWith(index: event.index)));
  }
}
