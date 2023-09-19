part of 'drop1_bloc.dart';

@immutable
abstract class Drop1Event {}

class Drop1LoadedEvent extends Drop1Event {}

class Drop1SelectedEvent extends Drop1Event {
  final String key;
  Drop1SelectedEvent(this.key);
}

class Drop2SelectedEvent extends Drop1Event {
  final String key;
  Drop2SelectedEvent(this.key);
}
