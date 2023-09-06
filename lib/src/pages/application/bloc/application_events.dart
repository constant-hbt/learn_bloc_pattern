abstract class ApplicationEvent {
  const ApplicationEvent();
}

class TriggerApplicationEvent extends ApplicationEvent {
  final int index;

  const TriggerApplicationEvent(this.index) : super();
}
