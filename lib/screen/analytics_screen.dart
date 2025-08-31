import 'package:ex_spend/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {

  final double _totalIncome = 50000.00;
  final double _totalSpending = 12500.00;
  int touchedIndex = -1;

  final Map<String, double> _spendingData = {
    'Food': 4500.00,
    'Shopping': 3200.00,
    'Transport': 1800.00,
    'Bills': 2000.00,
    'Other': 1000.00,
  };

  final List<Map<String, dynamic>> _recentTransactions = [
    {'type': 'in', 'description': 'Monthly Salary', 'amount': 50000.00},
    {'type': 'out', 'description': 'Groceries for the week', 'amount': 2200.00},
    {'type': 'out', 'description': 'New Jacket', 'amount': 1500.00},
    {'type': 'out', 'description': 'Electricity Bill', 'amount': 1200.00},
    {'type': 'out', 'description': 'Movie Night', 'amount': 800.00},
  ];

  final List<Color> _categoryColors = [
    Colors.blueAccent[100]!,
    Colors.greenAccent[100]!,
    Colors.orangeAccent[100]!,
    Colors.purpleAccent[100]!,
    Colors.redAccent[100]!,
  ];

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    double scrHeight = MediaQuery.of(context).size.height;

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
          icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Analytics',
          style: TextStyle(
            color: Colors.white,
            fontSize: scrHeight * 0.025,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: scrWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: scrHeight * 0.02),
            _buildSummaryCards(),
            SizedBox(height: scrHeight * 0.04),
            Text('Spending Breakdown',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: scrHeight * 0.022,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: scrHeight * 0.02),
            _buildSpendingChart(scrHeight),
            SizedBox(height: scrHeight * 0.04),
            Text('Recent Transactions',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: scrHeight * 0.022,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: scrHeight * 0.01),
            _buildRecentTransactions(),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCards() {
    return Row(
      children: [
        Expanded(
            child: _summaryCard('Total Income', _totalIncome, Colors.greenAccent[400]!)),
        const SizedBox(width: 16),
        Expanded(
            child:
                _summaryCard('Total Spending', _totalSpending, Colors.redAccent[200]!)),
      ],
    );
  }

  Widget _summaryCard(String title, double amount, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[400], fontSize: 14)),
          const SizedBox(height: 8),
          Text(
            'Rs.${amount.toStringAsFixed(2)}',
            style: TextStyle(
                color: color, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSpendingChart(double scrHeight) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
           Expanded(
             flex: 2,
             child: SizedBox(
              height: scrHeight * 0.2,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex =
                            pieTouchResponse.touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 2,
                  centerSpaceRadius: scrHeight * 0.04,
                  sections: _getChartSections(),
                ),
              ),
                       ),
           ),
          const SizedBox(width: 20),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(_spendingData.length, (index) {
                final category = _spendingData.keys.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: _indicator(
                      color: _categoryColors[index], text: category),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  List<PieChartSectionData> _getChartSections() {
    return List.generate(_spendingData.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 16.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      final category = _spendingData.keys.elementAt(i);
      final amount = _spendingData[category]!;
      final percentage = (amount / _totalSpending) * 100;

      return PieChartSectionData(
        color: _categoryColors[i],
        value: amount,
        title: '${percentage.toStringAsFixed(0)}%',
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff)),
      );
    });
  }

  Widget _indicator({required Color color, required String text}) {
    return Row(
      children: [
        Container(width: 12, height: 12, color: color),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }

  Widget _buildRecentTransactions() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _recentTransactions.length,
        itemBuilder: (context, index) {
          final transaction = _recentTransactions[index];
          final isIncome = transaction['type'] == 'in';
          return ListTile(
            leading: Icon(
              isIncome ? Icons.arrow_downward : Icons.arrow_upward,
              color: isIncome ? Colors.greenAccent[400] : Colors.redAccent[200],
            ),
            title: Text(transaction['description'],
                style: const TextStyle(color: Colors.white)),
            trailing: Text(
              '${isIncome ? '+' : '-'}Rs.${transaction['amount'].toStringAsFixed(2)}',
              style: TextStyle(
                  color: isIncome ? Colors.greenAccent[400] : Colors.redAccent[200],
                  fontWeight: FontWeight.bold),
            ),
          );
        },
        separatorBuilder: (context, index) =>
            Divider(color: Colors.grey[800], height: 1),
      ),
    );
  }
}

