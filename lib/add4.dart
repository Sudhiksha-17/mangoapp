import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mangoapp/add5.dart';
import 'package:mangoapp/add6.dart';

class MangoFarmDetailsPage1 extends StatelessWidget {
  MangoFarmDetailsPage1({super.key});

  String _selectedMangoVariety = 'Kesar';
  late final TextEditingController _areaController = TextEditingController();
  late final TextEditingController _treeCountController =
      TextEditingController();
  late final TextEditingController _ageOfTreesController =
      TextEditingController();

  Future<void> _saveMangoVarietyDetails(BuildContext context) async {
    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Save mango variety details to Firestore under FarmDetails4 subsection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('FarmerDetails4')
          .add({
        'mangoVariety': _selectedMangoVariety,
        'area': _areaController.text,
        'treeCount': _treeCountController.text,
        'ageOfTrees': _ageOfTreesController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff006e21),
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
            _buildSubHeading('Mango Variety'),
            const SizedBox(height: 10),
            _buildDropDown(
              'Name of the mango variety',
              ['Kesar', 'Alphonso', 'Malgova'],
            ),
            const SizedBox(height: 20),
            _buildSubHeading('Area of this variety'),
            const SizedBox(height: 10),
            _buildTextField(
              'Area spent on this variety in acres',
              TextInputType.number,
              controller: _areaController,
            ),
            const SizedBox(height: 20),
            _buildSubHeading('Count of trees in this variety'),
            const SizedBox(height: 10),
            _buildTextField(
              'Number of trees of this variety',
              TextInputType.number,
              controller: _treeCountController,
            ),
            const SizedBox(height: 20),
            _buildSubHeading('Age of trees'),
            const SizedBox(height: 10),
            _buildTextField(
              'Period since the trees are planted(in yrs/months)',
              TextInputType.text,
              controller: _ageOfTreesController,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                await _saveMangoVarietyDetails(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtherPlantsDetailsPage(),
                  ),
                );
              },
              child: const Text(
                '+ Add variety',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await _saveMangoVarietyDetails(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtherPlantsDetailsPage(),
                    ),
                  );
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

  Widget _buildTextField(
    String placeholder,
    TextInputType inputType, {
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholder,
        border: const OutlineInputBorder(),
      ),
      keyboardType: inputType,
    );
  }

  Widget _buildDropDown(String placeholder, List<String> options) {
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
          value: _selectedMangoVariety,
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            if (value != null) {
              _selectedMangoVariety = value;
            }
          },
        ),
      ),
    );
  }
}
