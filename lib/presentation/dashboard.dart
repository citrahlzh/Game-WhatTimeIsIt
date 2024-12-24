import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc_manage/sound_bloc.dart';
import 'choosemode.dart';
import 'rules.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SizedBox.expand(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('../assets/images/image1.png'),
                      fit: BoxFit.contain,
                      opacity: 0.3),
                  gradient: LinearGradient(
                      colors: [Color(0xFF001F3F), Color(0xFF5292B9)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Center(
                child: SizedBox(
                  height: 450,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            Color(0xFFEAD8B1),
                            Color(0xFFEAD8B1),
                            Color(0xFF3A6D8C)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'WHAT TIME IS IT',
                                style: TextStyle(
                                    fontFamily: 'Halo Dek',
                                    fontSize: 90,
                                    color: Colors.white,
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
                              ),
                              Transform.rotate(
                                angle: 0.2,
                                child: const Text(
                                  '?',
                                  style: TextStyle(
                                      fontFamily: 'Halo Dek',
                                      fontSize: 125,
                                      color: Colors.white,
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
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ]),
                      ),
                      SizedBox(
                        width: 600,
                        height: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChooseMode()),
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
                              'MAINKAN',
                              style: TextStyle(
                                  fontFamily: 'Super Earthly',
                                  fontSize: 50,
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
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 600,
                        height: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Rules()));
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
                              'ATURAN PERMAINAN',
                              style: TextStyle(
                                  fontFamily: 'Super Earthly',
                                  fontSize: 50,
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
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: BlocBuilder<BacksoundBloc, BacksoundState>(
              builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 45, 0),
              child: FloatingActionButton(
                onPressed: () {
                  context.read<BacksoundBloc>().add(ToggleSoundEvent());
                },
                backgroundColor: Colors.transparent,
                focusColor: Colors.transparent,
                elevation: 0,
                child: Icon(
                  state.isSoundOn ? Icons.volume_up : Icons.volume_off,
                  color: Colors.white,
                  size: 70,
                ),
              ),
            );
          }),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        ));
  }
}
