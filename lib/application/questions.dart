import 'dart:math';

// Fungsi untuk menghasilkan waktu acak
List<Map<String, dynamic>> generateRandomTimesWithAnswers(int count) {
  Random random = Random();

  // Fungsi untuk mencari jawaban berdasarkan jam dan menit
  String getEnglishTime(int hours, int minutes) {
    hours = hours % 12 == 0 ? 12 : hours % 12; // Pastikan format 12 jam

    if (minutes == 0) {
      return "$hours o’clock";
    } else if (minutes == 15) {
      return "Quarter past $hours";
    } else if (minutes == 30) {
      return "Half past $hours";
    } else if (minutes == 45) {
      int nextHour = (hours % 12) + 1; // Jam berikutnya
      return "Quarter to $nextHour";
    } else if (minutes < 30) {
      return "$minutes past $hours";
    } else {
      int nextHour = (hours % 12) + 1; // Jam berikutnya
      int minutesTo = 60 - minutes;
      return "$minutesTo to $nextHour";
    }
  }

  // Membuat daftar waktu acak
  List<Map<String, dynamic>> randomTimes = List.generate(count, (_) {
    int randomHour = random.nextInt(12) + 1; // Jam antara 1-12
    int randomMinute = random.nextInt(60); // Menit antara 0-59

    return {
      'X': randomHour,
      'Y': randomMinute,
      'answer': getEnglishTime(randomHour, randomMinute),
    };
  });

  return randomTimes;
}
