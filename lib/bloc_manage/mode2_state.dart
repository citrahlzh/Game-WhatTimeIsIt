part of 'mode2_bloc.dart';

class Mode2State {
  final String question;
  final List<Map<String, dynamic>> options;
  final Map<String, dynamic>? correctClock;
  final bool? isCorrect;

  Mode2State({
    required this.question,
    required this.options,
    this.correctClock,
    this.isCorrect,
  });

  factory Mode2State.initial() {
    return Mode2State(
      question: "",
      options: [],
      correctClock: null,
      isCorrect: null,
    );
  }

  Mode2State copyWith({
    String? question,
    List<Map<String, dynamic>>? options,
    Map<String, dynamic>? correctClock,
    bool? isCorrect,
  }) {
    return Mode2State(
      question: question ?? this.question,
      options: options ?? this.options,
      correctClock: correctClock ?? this.correctClock,
      isCorrect: isCorrect,
    );
  }
}