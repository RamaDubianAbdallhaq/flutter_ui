
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.onTT});
 final int counter = 0;
  Function onTT;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.brown.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                onTT.call();
                // controller.nextPage(
                //   duration: Duration(seconds: 2),
                //   curve: Curves.easeInOutBack,
                // );
              },
              child: Container(
                // child: FlutterLogo(),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        Image.network(
                          "https://www.google.com/images/branding/googlelogo/1x/googlelogo_light_color_272x92dp.png",
                        ).image,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.yellow, Colors.black, Colors.brown],
                  ),
                   borderRadius: BorderRadius.circular(20),
                   border: Border.all(color: const Color.fromARGB(255, 152, 21, 53),width: 6),
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}