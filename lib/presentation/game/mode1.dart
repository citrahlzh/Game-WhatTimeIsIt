import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_whattimeisit/presentation/success.dart';
import 'package:game_whattimeisit/presentation/failed.dart';
import '../../application/clock_small.dart';
import '../../bloc_manage/mode1_bloc.dart';

class GameMode1 extends StatelessWidget {
  const GameMode1({super.key});

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
                  "MODE 1",
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
            body: BlocListener<Mode1Bloc, Mode1State>(
              listener: (context, state) {
                if (state is InitialMode1State) {
                  print("Game has been reset.");
                }
                print(
                    "state.userAnswers.length: ${state.userAnswers.length}; state.questions.length: ${state.questions.length}");

                if (state.userAnswers.length == state.questions.length &&
                    state.questions.isNotEmpty &&
                    state.userAnswers.every((answer) => answer != null)) {
                  int correctAnswers = 0;

                  for (int i = 0; i < state.questions.length; i++) {
                    if (state.userAnswers[i] == state.questions[i]['correct']) {
                      correctAnswers++;
                    }
                  }

                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      print("showDialog");
                      return BlocProvider.value(
                        value: context.read<Mode1Bloc>(),
                        child: AlertDialog(
                          backgroundColor: Colors.transparent,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('../../../assets/images/check.png'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 170,
                                    height: 70,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF001F3F),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                          border: Border.all(
                                              color: const Color(0xFFEAD8B1),
                                              width: 1.5)),
                                      child: Center(
                                        child: SizedBox(
                                          width: 150,
                                          height: 50,
                                          child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xFF3A6D8C),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  side: const BorderSide(
                                                      color: Color(0xFFEAD8B1),
                                                      width: 1.5)),
                                              onPressed: () {
                                                Navigator.of(dialogContext)
                                                    .pop();
                                                if (correctAnswers ==
                                                    state.questions.length) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Success())).then(
                                                      (_) {
                                                    print(
                                                        "Resetting game and generating new questions...");
                                                    context
                                                        .read<Mode1Bloc>()
                                                        .add(ResetGameEvent());
                                                    context.read<Mode1Bloc>().add(
                                                        GenerateQuestionsEvent(
                                                            3));
                                                  });
                                                } else {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Failed())).then(
                                                      (_) {
                                                    context
                                                        .read<Mode1Bloc>()
                                                        .add(ResetGameEvent());
                                                    context.read<Mode1Bloc>().add(
                                                        GenerateQuestionsEvent(
                                                            3));
                                                  });
                                                }
                                              },
                                              child: const Center(
                                                child: Text(
                                                  'Sudah Yakin',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color(0xFFEAD8B1),
                                                    fontFamily:
                                                        'Spooky Scary Creepy',
                                                    shadows: [
                                                      Shadow(
                                                        color:
                                                            Color(0xFF1E1E1E),
                                                        offset:
                                                            Offset(2.0, 2.0),
                                                        blurRadius: 0.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 170,
                                    height: 70,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF001F3F),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                          border: Border.all(
                                              color: const Color(0xFFEAD8B1),
                                              width: 1.5)),
                                      child: Center(
                                        child: SizedBox(
                                          width: 150,
                                          height: 50,
                                          child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xFF3A6D8C),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  side: const BorderSide(
                                                      color: Color(0xFFEAD8B1),
                                                      width: 1.5)),
                                              onPressed: () {
                                                Navigator.pop(dialogContext);
                                              },
                                              child: const Center(
                                                child: Text(
                                                  'Belum Yakin',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color(0xFFEAD8B1),
                                                    fontFamily:
                                                        'Spooky Scary Creepy',
                                                    shadows: [
                                                      Shadow(
                                                        color:
                                                            Color(0xFF1E1E1E),
                                                        offset:
                                                            Offset(2.0, 2.0),
                                                        blurRadius: 0.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child:
                  BlocBuilder<Mode1Bloc, Mode1State>(builder: (context, state) {
                if (state.questions.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return SizedBox.expand(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    child: SizedBox(
                                      height: 70,
                                      width: 590,
                                      child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color(0xFF6A9AB0),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50)))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 570,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                              '../assets/images/image4.png',
                                              width: 150),
                                          const Text(
                                            'Look and Answer',
                                            style: TextStyle(
                                                fontFamily: 'Super Earthly',
                                                fontSize: 45,
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
                                                      offset:
                                                          Offset(-3.0, -3.0),
                                                      blurRadius: 0.0),
                                                  Shadow(
                                                      color: Color(0xFF1E1E1E),
                                                      offset: Offset(-3.0, 3.0),
                                                      blurRadius: 0.0)
                                                ]),
                                          )
                                        ]),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const SizedBox(
                                width: 300,
                                child: Text(
                                  'Look at the picture and put a tick (✓)',
                                  style: TextStyle(
                                      fontSize: 33,
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
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 25),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:
                                state.questions.asMap().entries.map((entry) {
                              final index = entry.key;
                              final question = entry.value;

                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomPaint(
                                    size: const Size(175, 175),
                                    painter: ClockPainterSmall(
                                        question['X'], question['Y']),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                    height: 200,
                                  ),
                                  SizedBox(
                                    width: 600,
                                    child: Text(
                                      question['question'],
                                      style: const TextStyle(
                                        fontSize: 35,
                                        color: Color(0xFFEAD8B1),
                                        fontFamily: 'Spooky Scary Creepy',
                                        shadows: [
                                          Shadow(
                                            color: Color(0xFF1E1E1E),
                                            offset: Offset(1.5, 1.5),
                                            blurRadius: 0.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Yes',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Color(0xFFEAD8B1),
                                                fontFamily:
                                                    'Spooky Scary Creepy',
                                                shadows: [
                                                  Shadow(
                                                    color: Color(0xFF1E1E1E),
                                                    offset: Offset(1.5, 1.5),
                                                    blurRadius: 0.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 15.0),
                                            Stack(children: [
                                              GestureDetector(
                                                onTap: () {
                                                  context.read<Mode1Bloc>().add(
                                                      SubmitAnswerEvent(
                                                          index, true));
                                                },
                                                child: Container(
                                                  width: 24.0,
                                                  height: 24.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xA5D9D9D9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(1.0),
                                                        blurRadius: 0.0,
                                                        offset:
                                                            const Offset(3, 3),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if (index <
                                                      state
                                                          .userAnswers.length &&
                                                  state.userAnswers[index] ==
                                                      true)
                                                const Icon(
                                                  Icons.check,
                                                  color: Colors.black,
                                                  size: 24,
                                                ),
                                            ]),
                                          ],
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'No',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Color(0xFFEAD8B1),
                                                fontFamily:
                                                    'Spooky Scary Creepy',
                                                shadows: [
                                                  Shadow(
                                                    color: Color(0xFF1E1E1E),
                                                    offset: Offset(1.5, 1.5),
                                                    blurRadius: 0.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 15.0),
                                            Stack(children: [
                                              GestureDetector(
                                                onTap: () {
                                                  context.read<Mode1Bloc>().add(
                                                      SubmitAnswerEvent(
                                                          index, false));
                                                },
                                                child: Container(
                                                  width: 24.0,
                                                  height: 24.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xA5D9D9D9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(1.0),
                                                        blurRadius: 0.0,
                                                        offset:
                                                            const Offset(3, 3),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if (index <
                                                      state
                                                          .userAnswers.length &&
                                                  state.userAnswers[index] ==
                                                      false)
                                                const Icon(
                                                  Icons.check,
                                                  color: Colors.black,
                                                  size: 24,
                                                ),
                                            ]),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
