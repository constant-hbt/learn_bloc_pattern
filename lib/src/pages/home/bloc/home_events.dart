abstract class HomeEvents {
  const HomeEvents();
}

class HomeDots extends HomeEvents {
  const HomeDots(this.index) : super();

  final int index;
}
