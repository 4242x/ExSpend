import 'package:ex_spend/screen/home_screen.dart';
import 'package:ex_spend/screen/landing_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return const HomeScreen();
  } else {
      return const LandingScreen();
    }
  
  }
}