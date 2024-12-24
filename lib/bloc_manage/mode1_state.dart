part of 'mode1_bloc.dart';

class Mode1State extends Equatable {
  final List<Map<String, dynamic>> questions; // List soal
  final List<bool?> userAnswers; // Jawaban pengguna
  final bool isCompleted; // Status apakah semua soal selesai
  final int score; // Skor pemain

  const Mode1State({
    required this.questions,
    required this.userAnswers,
    required this.isCompleted,
    required this.score,
  });

  factory Mode1State.initial() {
    return const Mode1State(
      questions: [],
      userAnswers: [],
      isCompleted: false,
      score: 0,
    );
  }

  Mode1State copyWith({
    List<Map<String, dynamic>>? questions,
    List<bool?>? userAnswers,
    bool? isCompleted,
    int? score,
  }) {
    return Mode1State(
      questions: questions ?? this.questions,
      userAnswers: userAnswers ?? this.userAnswers,
      isCompleted: isCompleted ?? this.isCompleted,
      score: score ?? this.score,
    );
  }

  @override
  List<Object?> get props => [questions, userAnswers, isCompleted, score];
}

class InitialMode1State extends Mode1State {
  const InitialMode1State(
      {required super.questions,
      required super.userAnswers,
      required super.isCompleted,
      required super.score});
}
