import 'package:flutter/material.dart';
import 'package:path_provider_file/view/FileTow.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 375,
        // height: 675,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 50),

              Wrap(
                alignment: WrapAlignment.end,
                spacing: 50,
                children: [
                  // Stack(
                  //   alignment: Alignment.topLeft,
                  //   children: [
                  //     Positioned(
                  //       top: 2,
                  //       right: 3,
                  //       child: Transform.rotate(
                  //         angle: 0.5, // الزاوية بالتقدير الدائري
                  //         child: Stack(
                  //           alignment: Alignment.topLeft,
                  //           children: [
                  //             Positioned(
                  //               top: 2,
                  //               right: 3,
                  //               child: Icon(
                  //                 Icons.square,
                  //                 size: 40,
                  //                 color: Color.fromARGB(255, 252, 59, 194),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  // Stack(
                  //   alignment: Alignment.topLeft,
                  //   children: [
                  //     Transform.rotate(
                  //       angle: 0.5,
                  //       child: Icon(
                  //         Icons.square,
                  //         size: 40,
                  //         color: Color.fromARGB(255, 252, 59, 194),
                  //       ),
                  //     ),
                  //     Transform.rotate(
                  //       angle: 0.5,
                  //       child: Padding(
                  //         padding: EdgeInsets.only(top: 5, left: 5),
                  //         child: Icon(
                  //           Icons.video_file,
                  //           size: 30,
                  //           color: Colors.blue,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: const [
                      Icon(
                        Icons.square,
                        size: 40,
                        color: Color.fromARGB(255, 199, 27, 187),
                      ),

                      Positioned(
                        top: 7,
                        child: Icon(
                          Icons.video_file,
                          size: 40,
                          color: Color.fromARGB(255, 246, 246, 245),
                        ),
                      ),
                    ],
                  ),

                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: const [
                      Icon(
                        Icons.square,
                        size: 40,
                        color: Color.fromARGB(255, 230, 220, 87),
                      ),

                      Positioned(
                        top: 7,
                        child: Icon(
                          Icons.music_video_outlined,
                          size: 40,
                          color: Color.fromARGB(255, 246, 246, 245),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topLeft,
                    children: const [
                      Icon(
                        Icons.square,
                        size: 40,
                        color: Color.fromARGB(255, 26, 157, 70),
                      ),
                      Positioned(
                        top: 7,
                        right: 7,
                        child: Icon(
                          Icons.insert_drive_file,
                          size: 40,
                          color: Color.fromARGB(255, 246, 248, 247),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topLeft,
                    children: const [
                      Icon(
                        Icons.square,
                        size: 40,
                        color: Color.fromARGB(255, 45, 101, 185),
                      ),
                      Positioned(
                        top: 7,
                        child: Icon(
                          Icons.image,
                          size: 40,
                          color: Color.fromARGB(255, 242, 242, 243),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Stack(
                // alignment: Alignment.center,
                children: const [
                  Icon(Icons.folder, size: 150, color: Colors.amber),

                  Positioned(
                    top: 30,
                    right: 40,
                    child: Icon(Icons.cloud, size: 150, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              const Text(
                'Manage your files\nin a simple way',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'You could integrate your local files\nwith the files in cloud storage',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pinkAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
