import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/dashboard.dart';
import 'application/backsound.dart';
import 'bloc_manage/sound_bloc.dart';

void main() {
  final backSoundManager = Backsound();

  runApp(BlocProvider(
    create: (_) => BacksoundBloc(backSoundManager: backSoundManager)
      ..backSoundManager
          .playBackgroundSound('../../../assets/audios/backsound-boba.mp3'),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}
