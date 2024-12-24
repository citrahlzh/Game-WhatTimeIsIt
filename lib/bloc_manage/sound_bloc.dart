import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import '../application/backsound.dart';
part 'sound_event.dart';
part 'sound_state.dart';

class BacksoundBloc extends Bloc<BacksoundEvent, BacksoundState> {
  final Backsound backSoundManager;

  BacksoundBloc({required this.backSoundManager})
      : super(const BacksoundState(isSoundOn: true)) {
    on<ToggleSoundEvent>((event, emit) {
      final currentState = state.isSoundOn;

      if (currentState) {
        backSoundManager.pauseBackgroundSound();
      } else {
        backSoundManager.resumeBackgroundSound();
      }

      emit(BacksoundState(isSoundOn: !currentState));
    });
  }
}