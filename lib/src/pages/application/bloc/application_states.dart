class ApplicationState {
  final int index;

  const ApplicationState({this.index = 0});

  ApplicationState copyWith({int? index}) {
    return ApplicationState(index: index ?? this.index);
  }
}
