import 'package:bloc_pattern/src/pages/home/bloc/home_events.dart';
import 'package:bloc_pattern/src/pages/home/bloc/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlocs extends Bloc<HomeEvents, HomeStates> {
  HomeBlocs() : super(const HomeStates()) {
    on<HomeDots>(_homeDots);
  }

  void _homeDots(HomeDots event, Emitter<HomeStates> emit) {
    emit(state.copyWith(index: event.index));
  }
}
