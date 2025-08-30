import 'package:ex_spend/screen/home_screen.dart';
import 'package:flutter/material.dart';

class SpendingScreen extends StatefulWidget {
  const SpendingScreen({super.key});

  @override
  State<SpendingScreen> createState() => _SpendingScreenState();
}

class _SpendingScreenState extends State<SpendingScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  double _currentBalance = 50000.00; 
  double _todaysSpending = 0.00;
  String? _selectedCategory = 'Food';
  DateTime _selectedDate = DateTime.now();

  final List<String> _spendingCategories = [
    'Food',
    'Transport',
    'Shopping',
    'Bills',
    'Entertainment',
    'Other'
  ];

  void _addSpending() {
    final double? amount = double.tryParse(_amountController.text);
    if (amount != null && amount > 0 && _currentBalance >= amount) {
      setState(() {
        _currentBalance -= amount;
        _todaysSpending += amount;
        _amountController.clear();
        _descriptionController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Rs.$amount spent on $_selectedCategory successfully recorded!'),
          backgroundColor: Colors.red[700],
        ),
      );
    } else if (amount != null && _currentBalance < amount) {
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Insufficient balance for this transaction.'),
          backgroundColor: Colors.orange[800],
        ),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
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
          'Add Spending',
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
              padding: EdgeInsets.all(scrWidth * 0.05),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Current Balance',
                          style: TextStyle(color: Colors.grey[400])),
                      Text('Rs.${_currentBalance.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Today\'s Spending',
                          style: TextStyle(color: Colors.grey[400])),
                      Text('Rs.${_todaysSpending.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: scrHeight * 0.03),
            _buildTextField(
                label: 'Amount',
                controller: _amountController,
                hint: '0.00',
                prefix: 'Rs. ',
                keyboard: const TextInputType.numberWithOptions(decimal: true)),
            SizedBox(height: scrHeight * 0.02),
            _buildCategoryDropdown(scrHeight),
             SizedBox(height: scrHeight * 0.02),
            _buildTextField(
                label: 'Description (Optional)',
                controller: _descriptionController,
                hint: 'e.g., Lunch with friends'),
            SizedBox(height: scrHeight * 0.02),
             _buildDatePicker(context, scrHeight),
            SizedBox(height: scrHeight * 0.04),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addSpending,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Colors.redAccent[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
                child: const Text(
                  'Confirm Spending',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label,
      required TextEditingController controller,
      required String hint,
      String? prefix,
      TextInputType? keyboard}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey[300], fontSize: 16)),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: keyboard,
          style: const TextStyle(color: Colors.white, fontSize: 18),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[700]),
            prefixText: prefix,
            prefixStyle: TextStyle(color: Colors.grey[400], fontSize: 18),
            filled: true,
            fillColor: Colors.grey[900],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryDropdown(double scrHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Category', style: TextStyle(color: Colors.grey[300], fontSize: 16)),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          initialValue: _selectedCategory,
          onChanged: (String? newValue) {
            setState(() {
              _selectedCategory = newValue;
            });
          },
          items: _spendingCategories
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          dropdownColor: Colors.grey[900],
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[900],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none),
          ),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ),
      ],
    );
  }
   Widget _buildDatePicker(BuildContext context, double scrHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date', style: TextStyle(color: Colors.grey[300], fontSize: 16)),
        const SizedBox(height: 10),
        InkWell(
          onTap: () => _selectDate(context),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_selectedDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const Icon(Icons.calendar_today, color: Colors.white70),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
