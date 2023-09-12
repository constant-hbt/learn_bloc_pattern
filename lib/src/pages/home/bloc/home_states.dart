class HomeStates {
  const HomeStates({
    this.index = 0,
  });

  final int index;

  HomeStates copyWith({int? index}) {
    return HomeStates(
      index: index ?? this.index,
    );
  }
}
