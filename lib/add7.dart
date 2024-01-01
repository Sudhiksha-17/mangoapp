import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'add6.dart';

class OtherPlantsDetailsPage2 extends StatelessWidget {
  OtherPlantsDetailsPage2({super.key});

  late final TextEditingController _cropNameController =
      TextEditingController();
  late final TextEditingController _areaController = TextEditingController();
  late final TextEditingController _plantCountController =
      TextEditingController();
  String _selectedIrrigationMethod = 'Drip irrigation';

  Future<void> _saveOtherPlantsDetails(BuildContext context) async {
    // Get the current user
    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Save other plants details to Firestore under OtherPlantsDetails2 subsection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('OtherPlantsDetails2') // Change subcollection name here
          .add({
        'cropName': _cropNameController.text,
        'area': _areaController.text,
        'plantCount': _plantCountController.text,
        'irrigationMethod': _selectedIrrigationMethod,
      });

      // Navigate to the next page (OtherPlantsDetailsPage or any other page)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtherPlantsDetailsPage(),
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
                'Please enter details about other plants here',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSubHeading('Crop Name'),
            const SizedBox(height: 10),
            _buildTextField('Name of the crop', TextInputType.text,
                controller: _cropNameController),
            const SizedBox(height: 20),
            _buildSubHeading('Area Utilized'),
            const SizedBox(height: 10),
            _buildTextField(
                'Area spent on this crop in acres', TextInputType.number,
                controller: _areaController),
            const SizedBox(height: 20),
            _buildSubHeading('Count of Plants'),
            const SizedBox(height: 10),
            _buildTextField(
                'Number of plants of this crop', TextInputType.number,
                controller: _plantCountController),
            const SizedBox(height: 20),
            _buildSubHeading('Irrigation Method'),
            const SizedBox(height: 10),
            _buildDropDown(
              'Method of irrigation',
              ['Drip irrigation', 'Sprinkler irrigation', 'Surface irrigation'],
              onChanged: (String? value) {
                if (value != null) {
                  _selectedIrrigationMethod = value;
                }
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Save details when the "Continue" button is pressed
                  _saveOtherPlantsDetails(context);
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
      {required void Function(String?) onChanged}) {
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
