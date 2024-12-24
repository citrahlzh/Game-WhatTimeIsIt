import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_whattimeisit/bloc_manage/mode1_bloc.dart';
import 'package:game_whattimeisit/bloc_manage/mode2_bloc.dart';
import 'package:game_whattimeisit/bloc_manage/mode3_bloc.dart';
import 'game/mode1.dart';
import 'game/mode2.dart';
import 'game/mode3.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

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
                      "PILIH MODE",
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
                  )),
              body: SizedBox.expand(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('../assets/images/image2.png'),
                        fit: BoxFit.cover,
                        opacity: 0.3),
                  ),
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        SizedBox(
                          width: 510,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => BlocProvider(
                                          create: (context) => Mode1Bloc()
                                            ..add(GenerateQuestionsEvent(3)),
                                          child: const GameMode1(),
                                        )),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6A9AB0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              elevation: 15,
                              shadowColor: const Color(0xFF1E1E1E),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                'MODE 1',
                                style: TextStyle(
                                    fontFamily: 'Super Earthly',
                                    fontSize: 60,
                                    color: Color(0xFFEAD8B1),
                                    shadows: [
                                      Shadow(
                                          color: Color(0xFF001F3F),
                                          offset: Offset(3.0, 8.0),
                                          blurRadius: 3.0)
                                    ]),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                          width: 510,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => BlocProvider(
                                          create: (context) => Mode2Bloc()
                                            ..add(InitializeMode2Event()),
                                          child: const GameMode2(),
                                        )),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6A9AB0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              elevation: 15,
                              shadowColor: const Color(0xFF1E1E1E),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                'MODE 2',
                                style: TextStyle(
                                    fontFamily: 'Super Earthly',
                                    fontSize: 60,
                                    color: Color(0xFFEAD8B1),
                                    shadows: [
                                      Shadow(
                                          color: Color(0xFF001F3F),
                                          offset: Offset(3.0, 8.0),
                                          blurRadius: 3.0)
                                    ]),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                          width: 510,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => BlocProvider(
                                          create: (context) => Mode3Bloc()
                                            ..add(GenerateRandomTimesEvent(1)),
                                          child: GameMode3(),
                                        )),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6A9AB0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              elevation: 15,
                              shadowColor: const Color(0xFF1E1E1E),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                'MODE 3',
                                style: TextStyle(
                                    fontFamily: 'Super Earthly',
                                    fontSize: 60,
                                    color: Color(0xFFEAD8B1),
                                    shadows: [
                                      Shadow(
                                          color: Color(0xFF001F3F),
                                          offset: Offset(3.0, 8.0),
                                          blurRadius: 3.0)
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ])),
                ),
              ),
            ),
          ),
        ));
  }
}
