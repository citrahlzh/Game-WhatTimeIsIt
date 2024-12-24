import 'package:flutter/material.dart';
import 'dashboard.dart';
// import '../widget/clock.dart';

class Success extends StatelessWidget {
  const Success({super.key});

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
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('../assets/images/success.png'),
                        Transform.translate(
                          offset: Offset(0, -120),
                          child: const Text(
                            'SELAMAT KAMU\nBENAR!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Super Earthly',
                                fontSize: 70,
                                color: Color(0xFF07491B),
                                height: 1.1,
                                shadows: [
                                  Shadow(
                                      color: Color(0xFFEAD8B1),
                                      offset: Offset(3.0, 3.0)),
                                  Shadow(
                                      color: Color(0xFFEAD8B1),
                                      offset: Offset(3.0, -3.0)),
                                  Shadow(
                                      color: Color(0xFFEAD8B1),
                                      offset: Offset(-3.0, -3.0)),
                                  Shadow(
                                      color: Color(0xFFEAD8B1),
                                      offset: Offset(-3.0, 3.0))
                                ]),
                          ),
                        ),
                      ],
                    ),
                    Transform.translate(
                      offset: Offset(0, -60),
                      child: SizedBox(
                        width: 400,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashboardPage()));
                              },
                              child: Container(
                                width: 150,
                                height: 70,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFEAD8B1),
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: const Center(
                                    child: Icon(Icons.home,
                                        color: Color(0xFF07491B), size: 50)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 150,
                                height: 70,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFEAD8B1),
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: const Center(
                                    child: Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFF07491B),
                                  size: 50,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
