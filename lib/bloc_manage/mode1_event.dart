part of 'mode1_bloc.dart';

abstract class Mode1Event extends Equatable {
  @override
  List<Object?> get props => [];
}

// Event untuk menghasilkan soal baru
class GenerateQuestionsEvent extends Mode1Event {
  final int questionCount; // Jumlah soal yang ingin dibuat

  GenerateQuestionsEvent(this.questionCount);

  @override
  List<Object?> get props => [questionCount];
}

// Event untuk memeriksa jawaban pengguna
class SubmitAnswerEvent extends Mode1Event {
  final int questionIndex; // Indeks soal
  final bool userAnswer; // Jawaban pengguna (true/false)

  SubmitAnswerEvent(this.questionIndex, this.userAnswer);

  @override
  List<Object?> get props => [questionIndex, userAnswer];
}

class ResetGameEvent extends Mode1Event{}