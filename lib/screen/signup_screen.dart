import 'package:ex_spend/screen/login_screen.dart';
import 'package:ex_spend/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

Future<void> createuserwithEmailAndPassword() async {
  if (passwordController.text != confirmPasswordController.text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Passwords do not match')),
    );
    return;
  }
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
   if (!mounted) return; 
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sign up failed: ${e.toString()}')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.sizeOf(context).width;
    double scrHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: scrWidth * 0.1,
            vertical: scrHeight * 0.045,
          ),
          child: Column(
            children: [
              SizedBox(height: scrHeight * 0.05),
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
                        'Sign Up',
                        style: TextStyle(
                          wordSpacing: scrWidth * -0.008,
                          fontFamily: 'Montserrat',
                          fontSize: scrHeight * 0.042,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontVariations: [FontVariation('wght', 800)],
                        ),
                      ),
                      SizedBox(height: scrHeight * 0.008),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: scrHeight * 0.016),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontVariations: [FontVariation('wght', 500)],
                              ),
                            ),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: const Color.fromARGB(255, 2, 165, 2),
                                fontVariations: [FontVariation('wght', 500)],
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                },
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
                            controller: emailController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
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
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
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
                            controller: passwordController,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
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
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: scrHeight * 0.015),
                          Text(
                            ' Confirm Password',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: scrHeight * 0.020,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontVariations: [FontVariation('wght', 500)],
                            ),
                          ),
                          SizedBox(height: scrHeight * 0.015),
                          TextFormField(
                            controller: confirmPasswordController, // <-- use controller
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            obscureText: true,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              focusColor: const Color.fromARGB(255, 2, 165, 2),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
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
                        child: InkWell(
                          borderRadius: BorderRadius.circular(48),
                          onTap: () async {
                            await createuserwithEmailAndPassword();
                          },
                          child: Center(
                            child: Text(
                              'Sign Up',
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
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
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    fontFamily: 'Montserrat',
                                    fontVariations: [
                                      FontVariation('wght', 600),
                                    ],
                                  ),
                                ),
                                SizedBox(width: scrWidth * 0.03),
                                Image.asset(
                                  'assets/icons/google_icon.png',
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
      ),
    );
  }
}
