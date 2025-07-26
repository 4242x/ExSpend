import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

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
          horizontal: scrWidth * 0.100,
          vertical: scrHeight * 0.045,
        ),
        child: Column(
          children: [ SizedBox(
            height: scrHeight* 0.07,
          ),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: scrWidth * 0.102),
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
              width: scrWidth * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color.fromARGB(38, 255, 255, 255),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: scrWidth * 0.055,
                  vertical: scrHeight * 0.028,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: scrHeight * 0.042,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontVariations: [FontVariation('wght', 800)],
                      ),
                    ),
                    SizedBox(height: scrHeight * 0.008),
                    RichText(
                      text: TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: TextStyle(fontSize: scrHeight * 0.016),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(
                              fontFamily: 'Montserrat',

                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontVariations: [FontVariation('wght', 500)],
                            ),
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              fontFamily: 'Montserrat',

                              color: const Color.fromARGB(255, 2, 165, 2),
                              fontVariations: [FontVariation('wght', 500)],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: scrHeight * 0.025),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' Email',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: scrHeight * 0.020,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontVariations: [FontVariation('wght', 500)],
                          ),
                        ),
                        SizedBox(height: scrHeight * 0.015),
                        TextFormField(
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            focusColor: const Color.fromARGB(255, 2, 165, 2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: scrHeight * 0.015),
                        Text(
                          ' Password',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: scrHeight * 0.020,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontVariations: [FontVariation('wght', 500)],
                          ),
                        ),
                        SizedBox(height: scrHeight * 0.015),
                        TextFormField(
                          obscureText: true,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            focusColor: const Color.fromARGB(255, 2, 165, 2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: scrHeight * 0.025),
                    Container(
                      height: scrHeight * 0.065,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 2, 165, 2),
                        borderRadius: BorderRadius.circular(48),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: scrWidth * 0.05,
                            color: Colors.white,
                            fontFamily: 'Quicksand',
                            fontVariations: [FontVariation('wght', 600)],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: scrHeight * 0.0176),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'or',
                            style: TextStyle(
                              height: 0.8,
                              fontSize: scrHeight * 0.0175,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      height: scrHeight * 0.065,
                      margin: EdgeInsets.only(top: scrHeight * 0.02),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(25, 255, 255, 255),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Continue with Google',
                                style: TextStyle(
                                  fontSize: scrHeight * 0.0173,
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: 'Montserrat',
                                  fontVariations: [FontVariation('wght', 600)],
                                ),
                              ),
                              SizedBox(width: scrWidth * 0.03)
                              ,
                              Image.asset('assets/icons/google_icon.png',
                                height: scrHeight * 0.0275,
                                width: scrHeight * 0.0275,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
