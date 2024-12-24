import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_whattimeisit/bloc_manage/mode2_bloc.dart';
import '../../application/clock.dart';
import '../success.dart';
import '../failed.dart';

class GameMode2 extends StatelessWidget {
  const GameMode2({super.key});

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
                      "MODE 2",
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
                body: BlocBuilder<Mode2Bloc, Mode2State>(
                    builder: (context, state) {
                  if (state.options.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.isCorrect != null) {
                    Future.delayed(Duration(seconds: 0), () {
                      if (state.isCorrect == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Success()),
                        ).then((_) {
                          context.read<Mode2Bloc>().add(InitializeMode2Event());
                        });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Failed()),
                        ).then((_) {
                          context.read<Mode2Bloc>().add(InitializeMode2Event());
                        });
                      }
                    });
                  }

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
                            children: <Widget>[
                              Text(
                                state.question,
                                style: const TextStyle(
                                    fontSize: 60,
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
                              const SizedBox(height: 10),
                              Center(
                                child: SizedBox(
                                  width: 800,
                                  height: 700,
                                  child: Center(
                                    child: Wrap(
                                      spacing: 30,
                                      runSpacing: 30,
                                      children: state.options.map((clock) {
                                        return GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<Mode2Bloc>()
                                                  .add(SelectMode2Event(clock));
                                            },
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: const Color(0x4CEAD8B1),
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(30.0),
                                                child: CustomPaint(
                                                    size: const Size(250, 250),
                                                    painter: ClockPainter(
                                                        clock['X'],
                                                        clock['Y'])),
                                              ),
                                            ));
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  );
                })),
          ),
        ));
  }
}
