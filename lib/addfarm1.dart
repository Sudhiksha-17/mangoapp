import 'package:flutter/material.dart';
import 'displayfarms.dart';
import 'addfarm2.dart';
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
        title: Text(
          'Add Farms',
          style: TextStyle(color: Color(0xff054500)), // Text color
        ),
        backgroundColor: Color(0xffffc900), // Background color
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xff054500),
          onPressed: () {
            // Navigate back to the display farms page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FarmsPage()),
            );
          },
        ),
      ),
      body: Container(
        color: Color(0xffffffff),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please enter farm details here',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff218f00),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 10),
            _buildTextFieldWithLabel('Farmer Name', 'Enter Farmer Name'),
            SizedBox(height: 10),
            _buildTextFieldWithLabel('Phone Number', 'Enter Phone Number'),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Farm Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff218f00),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Address Line 1',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Address Line 2(optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.attach_file), // Attachment icon
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    // Implement the logic to upload farmer ID proof
                  },
                  child: Text(
                    'Farmer ID Proof',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to AddFarmsPage2 when Continue button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddFarmsPage2()),
                  );
                },
                child: Text('Continue', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF006227),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff218f00),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
