import 'package:flutter/material.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});

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
              toolbarHeight: 110,
              backgroundColor: const Color(0x4CEAD8B1),
              centerTitle: true,
              title: const Padding(
                padding: EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),

                // Header
                child: Text(
                  "ATURAN PERMAINAN",
                  style: TextStyle(
                      fontFamily: 'Super Earthly',
                      fontSize: 80,
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

              // Back Button
              leading: Transform.translate(
                offset: const Offset(30.00, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Image(
                    height: 100,
                    image: AssetImage('../../assets/images/arrow_back.png'),
                  ),
                ),
              ),

              // Logo
              actions: [
                Transform.translate(
                  offset: const Offset(-30.0, 0.0),
                  child: Image.asset('../../assets/images/logo.png'),
                ),
              ],
            ),
            body: SizedBox.expand(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('../../assets/images/image2.png'),
                      fit: BoxFit.cover,
                      opacity: 0.3),
                ),
                child: Center(
                  child: Stack(
                    children: [
                      Center(
                        child: SizedBox(
                            width: 1200,
                            height: 750,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: const Color(0xA53A6D8C),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: const Color(0xFFEAD8B1), width: 4),
                              ),
                            )),
                      ),

                      // Rules
                      Center(
                        child: SizedBox(
                          width: 1120,
                          height: 680,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: const Color(0x996A9AB0),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: const Color(0xFFEAD8B1), width: 4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ListView(
                                children: const [
                                  ListTile(
                                      title: Text(
                                    "• Dalam permainan ini ada 3 mode, dan dalam setiap mode akan ada soal yang diberikan.",
                                    style: TextStyle(
                                        fontSize: 35,
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
                                  )),
                                  ListTile(
                                    title: Text(
                                      "• Mode ke-1 akan diberikan gambar berupa pertanyaan, lalu cara menjawabnya adalah dengan pilih (yes/no) apakah gambar dan pertanyaannya itu sesuai.",
                                      style: TextStyle(
                                          fontSize: 35,
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
                                  ),
                                  ListTile(
                                    title: Text(
                                      "• Mode ke-2 akan diberikan soal pilihan ganda dan pilih salah satu jawaban yang benar sesuai dengan pernyataan yang diberikan.",
                                      style: TextStyle(
                                          fontSize: 35,
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
                                  ),
                                  ListTile(
                                    title: Text(
                                      "• Mode ke-3 akan diberikan soal dengan gambar, lalu dijawab dengan cara diketik sendiri.",
                                      style: TextStyle(
                                          fontSize: 35,
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
                                  ),
                                  ListTile(
                                    title: Text(
                                      "• SELAMAT BELAJAR SAMBIL BERMAIN !!!",
                                      style: TextStyle(
                                          fontSize: 35,
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
                                  ),
                                ],
                              ),
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
        ),
      ),
    );
  }
}
