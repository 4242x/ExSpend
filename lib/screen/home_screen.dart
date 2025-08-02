import 'package:ex_spend/screen/history_screen.dart';
import 'package:ex_spend/screen/landing_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingScreen()),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error signing out: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.sizeOf(context).width;
    double scrHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      extendBodyBehindAppBar: true,

      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: scrWidth * 0.09,
            vertical: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: scrHeight * 0.045,
                    fontFamily: 'Montserrat',
                    fontVariations: [FontVariation('wght', 500)],
                  ),
                  children: [
                    TextSpan(
                      text: 'Welcome,\n',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontVariations: [FontVariation('wght', 500)],
                        color: Color.fromARGB(255, 2, 165, 2),
                      ),
                    ),
                    TextSpan(
                      text: 'User',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontVariations: [FontVariation('wght', 500)],
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: scrHeight * 0.03),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      scrHeight * 0.025,
                      scrWidth * 0.045,
                      scrHeight * 0.01,
                    ),
                    height: scrHeight * 0.15,
                    width: scrWidth * 0.55,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(38, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Current Balance',
                          style: TextStyle(
                            fontSize: scrHeight * 0.02,
                            fontFamily: 'Montserrat',
                            fontVariations: [FontVariation('wght', 500)],
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            scrHeight * 0.025,
                            scrHeight * 0.01,
                            0,
                            0,
                          ),
                          child: Text(
                            '₹ 10,000',
                            style: TextStyle(
                              fontSize: scrHeight * 0.038,
                              fontFamily: 'Montserrat',
                              fontVariations: [FontVariation('wght', 800)],
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: scrWidth * 0.03),
                  Column(
                    children: [
                      Container(
                        height: scrHeight * 0.068,
                        width: scrWidth * 0.24,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(38, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                         
                        ],
                      ),
                      ),

                      SizedBox(height: scrHeight * 0.014),
                      Container(
                        width: scrWidth * 0.24,
                        height: scrHeight * 0.068,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(38, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: scrHeight * 0.027),
              Text(
                'Analytics',
                style: TextStyle(
                  fontSize: scrHeight * 0.03,
                  fontFamily: 'Montserrat',
                  fontVariations: [FontVariation('wght', 700)],
                  color: Colors.white,
                ),
              ),
              SizedBox(height: scrHeight * 0.027),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: scrWidth * 0.21,
                    height: scrHeight * 0.1,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(38, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(),
                  ),
                  Container(
                    width: scrWidth * 0.3,
                    height: scrHeight * 0.1,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(38, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(),
                  ),
                  Container(
                    width: scrWidth * 0.21,
                    height: scrHeight * 0.1,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(38, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(),
                  ),
                ],
              ),
              SizedBox(height: scrHeight * 0.027),
              Row(
                children: [
                  Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: scrHeight * 0.028,
                      fontFamily: 'Montserrat',
                      fontVariations: [FontVariation('wght', 700)],
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HistoryScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.open_in_new_rounded, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: scrHeight * 0.015),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: scrWidth * 0.005,
                        vertical: scrHeight * 0.01,
                      ),
                      padding: EdgeInsets.all(scrWidth * 0.03),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(38, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaction ${index + 1}',
                            style: TextStyle(
                              fontSize: scrHeight * 0.022,
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontVariations: [FontVariation('wght', 600)],
                            ),
                          ),
                          Text(
                            'Rs.${(index + 1) * 100}.00',
                            style: TextStyle(
                              fontSize: scrHeight * 0.022,
                              color: const Color.fromARGB(255, 2, 165, 2),
                              fontFamily: 'Montserrat',
                              fontVariations: [FontVariation('wght', 600)],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
