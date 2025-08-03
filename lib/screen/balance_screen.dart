import 'package:ex_spend/screen/home_screen.dart';
import 'package:flutter/material.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.sizeOf(context).width;
    double scrHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        title: Text(
          'Add Balance',
          style: TextStyle(
            color: Colors.white,
            fontSize: scrHeight * 0.03,
            fontFamily: 'Montserrat',
            fontVariations: [FontVariation('wght', 600)],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(scrWidth * 0.06),
        child: Text(
          'Your balance is \$0.00',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
        ),
              ),
      ) );
  }
}