import 'package:ex_spend/screen/home_screen.dart';
import 'package:flutter/material.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  final TextEditingController _amountController = TextEditingController();
  double _currentBalance = 0.00;
  String? _selectedSource = 'Bank Account';
  final List<String> _fundSources = [
    'Bank Account',
    'Credit Card',
    'Cash',
    'Other'
  ];

  void _addBalance() {
    final double? amount = double.tryParse(_amountController.text);
    if (amount != null && amount > 0) {
      setState(() {
        _currentBalance += amount;
        _amountController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Rs.$amount added successfully from $_selectedSource!'),
          backgroundColor: Colors.green[700],
        ),
      );
    }
  }

  void _addQuickAmount(double amount) {
    setState(() {
      _currentBalance += amount;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Rs.$amount added successfully from $_selectedSource!'),
        backgroundColor: Colors.green[700],
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

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
          'Add Balance',
          style: TextStyle(
            color: Colors.white,
            fontSize: scrHeight * 0.025,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: scrWidth * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: scrHeight * 0.02),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(scrWidth * 0.06),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Text(
                    'Current Balance',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: scrHeight * 0.02,
                    ),
                  ),
                  SizedBox(height: scrHeight * 0.01),
                  Text(
                    'Rs.${_currentBalance.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: scrHeight * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: scrHeight * 0.04),
            Text(
              'Amount',
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: scrHeight * 0.02,
              ),
            ),
            SizedBox(height: scrHeight * 0.015),
            TextField(
              controller: _amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              style: const TextStyle(color: Colors.white, fontSize: 22),
              decoration: InputDecoration(
                hintText: '0.00',
                hintStyle: TextStyle(color: Colors.grey[700]),
                prefixText: 'Rs. ',
                prefixStyle: TextStyle(color: Colors.grey[400], fontSize: 22),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: scrHeight * 0.02),
            Wrap(
              spacing: 12.0,
              runSpacing: 8.0,
              children: [100, 500, 1000, 5000].map((amount) {
                return ActionChip(
                  label: Text(
                    '+Rs.$amount',
                    style: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () => _addQuickAmount(amount.toDouble()),
                  backgroundColor: Colors.grey[800],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.grey[700]!)),
                );
              }).toList(),
            ),
            SizedBox(height: scrHeight * 0.04),
            Text(
              'Source',
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: scrHeight * 0.02,
              ),
            ),
            SizedBox(height: scrHeight * 0.015),
            DropdownButtonFormField<String>(
              value: _selectedSource,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSource = newValue;
                });
              },
              items: _fundSources.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              dropdownColor: Colors.grey[900],
              style: const TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ),
            SizedBox(height: scrHeight * 0.05),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addBalance,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Color.fromARGB(255, 2, 165, 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'Confirm Addition',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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

