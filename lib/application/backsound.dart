import 'package:audioplayers/audioplayers.dart';

class Backsound {
  static final Backsound _instance = Backsound._internal();
  late AudioPlayer _audioPlayer;

  factory Backsound() {
    return _instance;
  }

  Backsound._internal() {
    _audioPlayer = AudioPlayer();
  }

  Future<void> playBackgroundSound(String audioAssetPath) async {
    await _audioPlayer.setSource(AssetSource(audioAssetPath));
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.resume();
  }

  Future<void> stopBackgroundSound() async {
    await _audioPlayer.stop();
  }

  Future<void> pauseBackgroundSound() async {
    await _audioPlayer.pause();
  }

  Future<void> resumeBackgroundSound() async {
    await _audioPlayer.resume();
  }
}
