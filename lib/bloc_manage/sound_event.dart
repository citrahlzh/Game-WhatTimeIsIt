part of 'sound_bloc.dart';

abstract class BacksoundEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ToggleSoundEvent extends BacksoundEvent {}
