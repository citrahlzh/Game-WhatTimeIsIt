import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:math';

part 'mode1_event.dart';
part 'mode1_state.dart';

class Mode1Bloc extends Bloc<Mode1Event, Mode1State> {
  Mode1Bloc() : super(Mode1State.initial()) {
    on<GenerateQuestionsEvent>(_onGenerateQuestions);
    on<SubmitAnswerEvent>(_onSubmitAnswer);
    on<ResetGameEvent>(_onResetGame);
  }

  void _onGenerateQuestions(
      GenerateQuestionsEvent event, Emitter<Mode1State> emit) {
    final random = Random();

    // Fungsi untuk mengonversi waktu menjadi string
    String getEnglishTime(int hours, int minutes) {
      const numberWords = [
        'zero',
        'one',
        'two',
        'three',
        'four',
        'five',
        'six',
        'seven',
        'eight',
        'nine',
        'ten',
        'eleven',
        'twelve',
        'thirteen',
        'fourteen',
        'fifteen',
        'sixteen',
        'seventeen',
        'eighteen',
        'nineteen',
        'twenty',
        'twenty one',
        'twenty two',
        'twenty three',
        'twenty four',
        'twenty five',
        'twenty six',
        'twenty seven',
        'twenty eight',
        'twenty nine',
        'thirty',
        'thirty one',
        'thirty two',
        'thirty three',
        'thirty four',
        'thirty five',
        'thirty six',
        'thirty seven',
        'thirty eight',
        'thirty nine',
        'forty',
        'forty one',
        'forty two',
        'forty three',
        'forty four',
        'forty five',
        'forty six',
        'forty seven',
        'forty eight',
        'forty nine',
        'fifty',
        'fifty one',
        'fifty two',
        'fifty three',
        'fifty four',
        'fifty five',
        'fifty six',
        'fifty seven',
        'fifty eight',
        'fifty nine',
      ];

      String hourWord = numberWords[hours % 12];
      if (minutes == 0) return "$hourWord o'clock";
      if (minutes == 15) return "quarter past $hourWord";
      if (minutes == 30) return "half past $hourWord";
      if (minutes == 45) return "quarter to ${numberWords[(hours + 1) % 12]}";

      if (minutes < 30) return "${numberWords[minutes]} minutes past $hourWord";
      return "${numberWords[60 - minutes]} minutes to ${numberWords[(hours + 1) % 12]}";
    }

    // Membuat soal secara random
    List<Map<String, dynamic>> questions =
        List.generate(event.questionCount, (_) {
      int randomHour = random.nextInt(12);
      int randomMinute = random.nextInt(12);
      bool isCorrectAnswer = random.nextBool();

      String correctAnswer =
          "Is it " + getEnglishTime(randomHour, randomMinute) + "?";
      String questionText = isCorrectAnswer
          ? correctAnswer
          : "Is it " +
              getEnglishTime(random.nextInt(12), random.nextInt(12)) +
              "?";

      return {
        'X': randomHour,
        'Y': randomMinute,
        'question': questionText,
        'correct': isCorrectAnswer,
      };
    });

    emit(state.copyWith(questions: questions, userAnswers: [], score: 0));
  }

  void _onSubmitAnswer(SubmitAnswerEvent event, Emitter<Mode1State> emit) {
    final userAnswers = List<bool?>.from(state.userAnswers);
    final questionIndex = event.questionIndex;
    final question = state.questions[event.questionIndex];
    final correctAnswer = question['correct'];

    // Menambahkan jawaban pengguna
    if (userAnswers.length <= questionIndex) {
      while (userAnswers.length <= questionIndex) {
        userAnswers.add(null); // Tambahkan null untuk jawaban yang belum
      }
    }
    userAnswers[questionIndex] = event.userAnswer;
    // if (userAnswers.length > questionIndex) {
    //   userAnswers[questionIndex] = event.userAnswer;
    // } else {
    //   userAnswers.add(event.userAnswer);
    // }

    // Menghitung skor
    int score = state.score;
    if (event.userAnswer == correctAnswer) {
      score += 1;
    }

    // Memeriksa apakah semua soal selesai
    bool isCompleted = userAnswers.length == state.questions.length;

    emit(state.copyWith(
      userAnswers: userAnswers,
      score: score,
      isCompleted: isCompleted,
    ));
  }

  Future<void> _onResetGame(
      ResetGameEvent event, Emitter<Mode1State> emit) async {
    emit(Mode1State.initial());
  }
}
