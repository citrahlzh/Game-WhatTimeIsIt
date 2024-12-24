part of 'mode3_bloc.dart';

abstract class Mode3Event {}

class GenerateRandomTimesEvent extends Mode3Event {
  final int count;
  GenerateRandomTimesEvent(this.count);
}
