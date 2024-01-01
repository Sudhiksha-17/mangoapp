import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mangoapp/add4.dart';

class AddFarmPage3 extends StatelessWidget {
  AddFarmPage3({super.key});

  final TextEditingController _numberOfVarietyController =
      TextEditingController();
  final TextEditingController _numberOfTreesController =
      TextEditingController();
  String _selectedIrrigationMethod = 'null';
  final TextEditingController _yieldController = TextEditingController();

  Future<void> _saveMangoFarmDetails(BuildContext context) async {
    // Get the current user
    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Save mango farm details to Firestore under MangoFarmDetails collection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('FarmerDetails3') // Change subcollection name here
          .add({
        'userId': user.uid,
        'numberOfVarieties': _numberOfVarietyController.text,
        'numberOfTrees': _numberOfTreesController.text,
        'irrigationMethod': _selectedIrrigationMethod,
        'yieldInPreviousYear': _yieldController.text,
      });

      // Navigate to the next page (MangoFarmDetailsPage1 or any other page)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MangoFarmDetailsPage1(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF006227),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: const Color(0xFFD3FFA6),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Please enter mango farm details here',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSubHeading('Mango Varieties'),
            const SizedBox(height: 10),
            _buildTextField('Number of mango variety', TextInputType.number,
                controller: _numberOfVarietyController),
            const SizedBox(height: 20),
            _buildSubHeading('Count of Mango Trees'),
            const SizedBox(height: 10),
            _buildTextField('Number of mango tree', TextInputType.number,
                controller: _numberOfTreesController),
            const SizedBox(height: 20),
            _buildSubHeading('Irrigation Method'),
            const SizedBox(height: 10),
            _buildDropDown(
              'Method of irrigation',
              ['Drip irrigation', 'Sprinkler irrigation', 'Surface irrigation'],
              onChanged: (String? value) {
                _selectedIrrigationMethod = value ?? '';
              },
            ),
            const SizedBox(height: 20),
            _buildSubHeading('Yield in Previous Year'),
            const SizedBox(height: 10),
            _buildTextField(
                'Yield of mangoes in the previous year', TextInputType.number,
                controller: _yieldController),
            const SizedBox(height: 20),
            const SizedBox(height: 20.0),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _saveMangoFarmDetails(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006227),
                ),
                child: const Text('Continue',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubHeading(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTextField(String placeholder, TextInputType inputType,
      {required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholder,
        border: const OutlineInputBorder(),
      ),
      keyboardType: inputType,
    );
  }

  Widget _buildDropDown(String placeholder, List<String> options,
      {required ValueChanged<String?> onChanged}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(placeholder),
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
