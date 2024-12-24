part of 'mode2_bloc.dart';

abstract class Mode2Event {}

class InitializeMode2Event extends Mode2Event {}

class SelectMode2Event extends Mode2Event {
  final Map<String, dynamic> selectedClock;

  SelectMode2Event(this.selectedClock);
}
