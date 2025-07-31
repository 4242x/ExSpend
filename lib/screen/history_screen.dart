import 'package:ex_spend/screen/home_screen.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
          'Transaction History',
          style: TextStyle(
            color: Colors.white,
            fontSize: scrHeight * 0.03,
            fontFamily: 'Montserrat',
            fontVariations: [FontVariation('wght', 600)],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: scrHeight * 0.02),
          Container(
            width: scrWidth,
            height: scrHeight * 0.075,
            decoration: const BoxDecoration(
              color: Color.fromARGB(25, 255, 255, 255),
            ),
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Current Balance:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: scrHeight * 0.021,
                    fontFamily: 'Montserrat',
                    fontVariations: [FontVariation('wght', 600)],
                  ),
                ),
                Text('Rs.10000.00',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 2, 165, 2),
                    fontSize: scrHeight * 0.022,
                    fontFamily: 'Montserrat',
                    fontVariations: [FontVariation('wght', 600)],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: scrHeight * 0.005),
          Expanded(
            child: ListView.builder(
              itemCount: 20, 
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: scrWidth * 0.05, vertical: scrHeight * 0.01),
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
        ]


      ),
      
    );
  }
}
