import 'package:bloc/bloc.dart';
import 'dart:math';
part 'mode2_state.dart';
part 'mode2_event.dart';

class Mode2Bloc extends Bloc<Mode2Event, Mode2State> {
  Mode2Bloc() : super(Mode2State.initial()) {
    on<InitializeMode2Event>((event, emit) {
      final clocks = _generateRandomTimes(4);
      final correctClock = clocks[Random().nextInt(clocks.length)];
      final question =
          "Which one is ${_getEnglishTime(correctClock['X'], correctClock['Y'])}?";

      emit(state.copyWith(
        question: question,
        options: clocks,
        correctClock: correctClock,
        isCorrect: null,
      ));
    });

    on<SelectMode2Event>((event, emit) {
      final isCorrect = event.selectedClock['X'] == state.correctClock!['X'] &&
          event.selectedClock['Y'] == state.correctClock!['Y'];

      emit(state.copyWith(isCorrect: isCorrect));
    });
  }

  String numberToWord(int number) {
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

    if (number < 0 || number > 59) {
      throw ArgumentError("Number must be between 0 and 59.");
    }

    return numberWords[number];
  }

  List<Map<String, dynamic>> _generateRandomTimes(int count) {
    Random random = Random();

    return List.generate(count, (_) {
      int randomHour = random.nextInt(12) + 1;
      int randomMinute = random.nextInt(60);
      return {
        'X': randomHour,
        'Y': randomMinute,
      };
    });
  }

  String _getEnglishTime(int hours, int minutes) {
    String hoursWord = numberToWord(hours);
    String minutesWord = numberToWord(minutes);

    hours = hours % 12 == 0 ? 12 : hours % 12;
    if (minutes == 0) return "$hoursWord o’clock";
    if (minutes == 15) return "Quarter past $hoursWord";
    if (minutes == 30) return "Half past $hoursWord";
    if (minutes == 45) {
      int nextHour = (hours % 12) + 1;
      return "Quarter to ${numberToWord(nextHour)}";
    }
    if (minutes < 30) return "$minutesWord past $hoursWord";
    int nextHour = (hours % 12) + 1;
    int minutesTo = 60 - minutes;
    return "${numberToWord(minutesTo)} to ${numberToWord(nextHour)}";
  }
}
