part of 'mode3_bloc.dart';

class Mode3State {
  final List<Map<String, dynamic>> randomTimes;

  Mode3State({required this.randomTimes});

  factory Mode3State.initial() => Mode3State(randomTimes: []);

  Mode3State copyWith({List<Map<String, dynamic>>? randomTimes}) {
    return Mode3State(
      randomTimes: randomTimes ?? this.randomTimes,
    );
  }
}
