import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.sizeOf(context).width;
    double scrHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: scrWidth * 0.105,
          vertical: scrHeight * 0.045,
        ),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: scrWidth * 0.1),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Ex',
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 165, 2),
                      fontFamily: 'Quicksand',
                      fontVariations: [FontVariation('wght', 700)],
                    ),
                  ),
                  TextSpan(
                    text: 'Spend',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: 'Quicksand',
                      fontVariations: [FontVariation('wght', 700)],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: scrHeight * 0.045),
            Container(
              width: scrWidth * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(scrWidth * 0.03),
                color: const Color.fromARGB(35, 255, 255, 255),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: scrWidth * 0.055, vertical: scrHeight * 0.02),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: scrWidth * 0.08,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontVariations: [FontVariation('wght', 800)],

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
