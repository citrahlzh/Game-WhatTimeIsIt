part of 'sound_bloc.dart';

class BacksoundState extends Equatable {
  final bool isSoundOn;

  const BacksoundState({required this.isSoundOn});

  @override
  List<Object?> get props => [isSoundOn];
}
