import 'package:flutter/material.dart';
import 'displayfarms.dart';
import 'add2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFarmsPage extends StatelessWidget {
  AddFarmsPage({Key? key}) : super(key: key);

  late final TextEditingController _farmerNameController =
      TextEditingController();
  late final TextEditingController _phoneNumberController =
      TextEditingController();
  late final TextEditingController _addressLine1Controller =
      TextEditingController();
  late final TextEditingController _addressLine2Controller =
      TextEditingController();
  late final TextEditingController _addressLine3Controller =
      TextEditingController();

  Future<void> _saveFarmerDetails(BuildContext context) async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Save farmer details under the specific user's document in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('FarmerDetails1')
          .add({
        'farmerName': _farmerNameController.text,
        'phoneNumber': _phoneNumberController.text,
        'addressLine1': _addressLine1Controller.text,
        'addressLine2': _addressLine2Controller.text,
        'addressLine3': _addressLine3Controller.text,
      });

      // Navigate to the next page (AddFarmsPage2 or any other page)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddFarmsPage2()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Farms',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff006e21),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DisplayFarms()),
            );
          },
        ),
      ),
      body: Container(
        color: const Color(0xFFD3FFA6),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please enter farm details here',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildTextFieldWithLabel(
              'Farmer Name',
              'Enter Farmer Name',
              _farmerNameController,
            ),
            const SizedBox(height: 10),
            _buildTextFieldWithLabel(
              'Phone Number',
              'Enter Phone Number',
              _phoneNumberController,
            ),
            const SizedBox(height: 10),
            _buildAddressTextField(),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.attach_file),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    // Implement the logic to upload farmer ID proof
                  },
                  child: const Text(
                    'Farmer ID Proof',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _saveFarmerDetails(context);
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

  Widget _buildTextFieldWithLabel(
      String label, String hintText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Farm Address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _addressLine1Controller,
          decoration: const InputDecoration(
            hintText: 'Address Line 1',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _addressLine2Controller,
          decoration: const InputDecoration(
            hintText: 'Address Line 2',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _addressLine3Controller,
          decoration: const InputDecoration(
            hintText: 'Address Line 3 (optional)',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
