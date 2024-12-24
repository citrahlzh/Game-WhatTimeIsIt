import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc_manage/mode3_bloc.dart';
import '../../application/clock.dart';
import '../success.dart';
import '../failed.dart';

class GameMode3 extends StatelessWidget {
  GameMode3({super.key});

  final TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SizedBox.expand(
            child: DecoratedBox(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF001F3F), Color(0xFF5292B9)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                toolbarHeight: 100,
                backgroundColor: const Color(0x4CEAD8B1),
                centerTitle: true,
                title: const Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
                  child: Text(
                    "MODE 3",
                    style: TextStyle(
                        fontFamily: 'Super Earthly',
                        fontSize: 70,
                        color: Color(0xFFEAD8B1),
                        shadows: [
                          Shadow(
                              color: Color(0xFF1E1E1E),
                              offset: Offset(3.0, 3.0),
                              blurRadius: 0.0),
                          Shadow(
                              color: Color(0xFF1E1E1E),
                              offset: Offset(3.0, -3.0),
                              blurRadius: 0.0),
                          Shadow(
                              color: Color(0xFF1E1E1E),
                              offset: Offset(-3.0, -3.0),
                              blurRadius: 0.0),
                          Shadow(
                              color: Color(0xFF1E1E1E),
                              offset: Offset(-3.0, 3.0),
                              blurRadius: 0.0)
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Transform.translate(
                    offset: const Offset(25.0, 0.0),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEAD8B1),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                          child: Icon(Icons.arrow_back,
                              color: Color(0xFF1E1E1E), size: 50)),
                    ),
                  ),
                ),
                actions: [
                  Transform.translate(
                    offset: const Offset(-25.0, 0.0),
                    child: Image.asset('../assets/images/Logo.png'),
                  ),
                ],
              ),
              body:
                  BlocBuilder<Mode3Bloc, Mode3State>(builder: (context, state) {
                if (state.randomTimes.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                final time = state.randomTimes.first;

                return SizedBox.expand(
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('../assets/images/image3.png'),
                          fit: BoxFit.fitHeight,
                          opacity: 0.3),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomPaint(
                              size: const Size(300, 300),
                              painter: ClockPainter(time['X'], time['Y'])),
                          const SizedBox(height: 30),
                          const Text(
                            'What time is it?',
                            style: TextStyle(
                                fontSize: 50,
                                color: Color(0xFFEAD8B1),
                                fontFamily: 'Spooky Scary Creepy',
                                shadows: [
                                  Shadow(
                                      color: Color(0xFF1E1E1E),
                                      offset: Offset(1.5, 1.5),
                                      blurRadius: 0.0),
                                  Shadow(
                                      color: Color(0xFF1E1E1E),
                                      offset: Offset(1.5, -1.5),
                                      blurRadius: 0.0),
                                  Shadow(
                                      color: Color(0xFF1E1E1E),
                                      offset: Offset(-1.5, -1.5),
                                      blurRadius: 0.0),
                                  Shadow(
                                      color: Color(0xFF1E1E1E),
                                      offset: Offset(-1.5, 1.5),
                                      blurRadius: 0.0)
                                ]),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: 600,
                            child: TextField(
                              controller: answerController,
                              cursorHeight: 30.0,
                              style: const TextStyle(
                                  color: Color(0xFF001F3F),
                                  fontFamily: 'Spooky Scary Creepy',
                                  fontSize: 30),
                              cursorColor: const Color(0xFF001F3F),
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color(0xA5EAD8B1),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    borderSide: BorderSide(
                                        color: Color(0xFF001F3F), width: 2.5)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  borderSide: BorderSide(
                                      color: Color(0xFF001F3F),
                                      width: 2.5,
                                      style: BorderStyle.solid),
                                ),
                              ),
                              textInputAction: TextInputAction.done,
                              onSubmitted: (value) {
                                final correctAnswer = time['answer'];
                                final isCorrect = value.trim().toLowerCase() ==
                                    correctAnswer.toString().toLowerCase();

                                if (isCorrect) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Success()));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Failed()));
                                }

                                answerController.clear();

                                context
                                    .read<Mode3Bloc>()
                                    .add(GenerateRandomTimesEvent(1));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })),
        )));
  }
}
