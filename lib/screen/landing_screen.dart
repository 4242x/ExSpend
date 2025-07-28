import 'package:ex_spend/screen/login_screen.dart';
import 'package:ex_spend/screen/signup_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: scrHeight * 0.4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: scrWidth * 0.125,
                      fontFamily: 'Quicksand',
                      fontVariations: [FontVariation('wght', 700)],
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Ex',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 2, 165, 2),
                        ),
                      ),
                      TextSpan(
                        text: 'Spend',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Spending. Confined.',
                  style: TextStyle(
                    height: scrHeight * 0.00085,
                    fontSize: scrWidth * 0.06,
                    wordSpacing: scrWidth * -0.006,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'Quicksand',
                    fontVariations: [FontVariation('wght', 500)],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: scrHeight * 0.1,
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) =>  LoginScreen(),
              )),
              child: Container(
                width: scrWidth * 0.8,
                height: scrHeight * 0.07,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 2, 165, 2),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Center(
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: scrWidth * 0.05,
                      color: Colors.white,
                      fontFamily: 'Quicksand',
                      fontVariations: [FontVariation('wght', 600)],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupScreen(),
                ),
              ),
              child: Container(
                width: scrWidth * 0.8,
                height: scrHeight * 0.07,
                margin: EdgeInsets.only(top: scrHeight * 0.02),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Center(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: scrWidth * 0.05,
                      color: const Color.fromARGB(255, 2, 165, 2),
                      fontFamily: 'Quicksand',
                      fontVariations: [FontVariation('wght', 600)],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: scrHeight * 0.015,
            ),
            Center(
              child: RichText(text: TextSpan(
                style: TextStyle(
                  fontSize: scrWidth * 0.04,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Quicksand',
                  fontVariations: [FontVariation('wght', 500)],
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Or continue as a '),
                  TextSpan(
                    text: 'Guest...',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 129, 129, 129),
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
