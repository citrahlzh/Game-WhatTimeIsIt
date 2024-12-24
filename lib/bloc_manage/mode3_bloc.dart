import 'package:bloc/bloc.dart';
import 'dart:math';

part 'mode3_event.dart';
part 'mode3_state.dart';

class Mode3Bloc extends Bloc<Mode3Event, Mode3State> {
  Mode3Bloc() : super(Mode3State.initial()) {
    on<GenerateRandomTimesEvent>(_onGenerateRandomTimesEvent);
  }

  void _onGenerateRandomTimesEvent(
      GenerateRandomTimesEvent event, Emitter<Mode3State> emit) {
    final randomTimes = _generateRandomTimes(event.count);
    emit(state.copyWith(randomTimes: randomTimes));
  }

  List<Map<String, dynamic>> _generateRandomTimes(int count) {
    Random random = Random();

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

    String getEnglishTime(int hours, int minutes) {
      hours = hours % 12 == 0 ? 12 : hours % 12;

      String hoursWord = numberToWord(hours);
      String minutesWord = numberToWord(minutes);

      print(
          "Processing time -> Hours: $hours ($hoursWord), Minutes: $minutes ($minutesWord)");

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

    List<Map<String, dynamic>> randomTimes = List.generate(count, (_) {
      int randomHour = random.nextInt(12) + 1;
      int randomMinute = random.nextInt(12);

      return {
        'X': randomHour,
        'Y': randomMinute * 5,
        'answer': getEnglishTime(randomHour, randomMinute * 5),
      };
    });

    return randomTimes;
  }
}
