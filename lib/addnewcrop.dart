
/*
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
        backgroundColor: Color(0xffffc900),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xff054500),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Color(0xffffffff),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Please enter details about other plants here',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xff218f00),
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildSubHeading('Crop Name'),
            SizedBox(height: 10),
            _buildTextField('Name of the crop', TextInputType.text),
            SizedBox(height: 20),
            _buildSubHeading('Area Utilized'),
            SizedBox(height: 10),
            _buildTextField(
                'Area spent on this crop in acres', TextInputType.number),
            SizedBox(height: 20),
            _buildSubHeading('Count of Plants'),
            SizedBox(height: 10),
            _buildTextField(
                'Number of plants of this crop', TextInputType.number),
            SizedBox(height: 20),
            _buildSubHeading('Irrigation Method'),
            SizedBox(height: 10),
            _buildDropDown(
              'Method of irrigation',
              ['Drip irrigation', 'Sprinkler irrigation', 'Surface irrigation'],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OtherPlantsDetailsPage()));
                },
                child: Text('Save', style: TextStyle(color: Colors.white)),
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

  Widget _buildSubHeading(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xff218f00),
      ),
    );
  }

  Widget _buildTextField(String placeholder, TextInputType inputType) {
    return TextField(
      decoration: InputDecoration(
        hintText: placeholder,
        border: OutlineInputBorder(),
      ),
      keyboardType: inputType,
    );
  }

  Widget _buildDropDown(String placeholder, List<String> options) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
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
          onChanged: (String? value) {
            // Handle dropdown value changes
          },
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'addothercrop1.dart';

class OtherPlantsDetailsPage2 extends StatefulWidget {
  OtherPlantsDetailsPage2({Key? key}) : super(key: key);

  @override
  _OtherPlantsDetailsPage2State createState() => _OtherPlantsDetailsPage2State();
}

class _OtherPlantsDetailsPage2State extends State<OtherPlantsDetailsPage2> {
  final TextEditingController _cropNameController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _plantCountController = TextEditingController();
  String _selectedIrrigationMethod = '';

  Future<void> _saveOtherPlantsDetails(BuildContext context) async {
    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('OtherPlantsDetails2')
          .add({
        'cropName': _cropNameController.text,
        'area': _areaController.text,
        'plantCount': _plantCountController.text,
        'irrigationMethod': _selectedIrrigationMethod,
      });

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
        backgroundColor: Color(0xffffc900),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xff054500),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Color(0xffffffff),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Please enter details about other plants here',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xff218f00),
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildSubHeading('Crop Name'),
            SizedBox(height: 10),
            _buildTextField('Name of the crop', TextInputType.text),
            SizedBox(height: 20),
            _buildSubHeading('Area Utilized'),
            SizedBox(height: 10),
            _buildTextField(
                'Area spent on this crop in acres', TextInputType.number),
            SizedBox(height: 20),
            _buildSubHeading('Count of Plants'),
            SizedBox(height: 10),
            _buildTextField(
                'Number of plants of this crop', TextInputType.number),
            SizedBox(height: 20),
            _buildSubHeading('Irrigation Method'),
            SizedBox(height: 10),
            _buildDropDown(
              'Method of irrigation',
              ['Drip irrigation', 'Sprinkler irrigation', 'Surface irrigation'],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OtherPlantsDetailsPage()));
                },
                child: Text('Save', style: TextStyle(color: Colors.white)),
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

  Widget _buildSubHeading(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xff218f00),
      ),
    );
  }

  Widget _buildTextField(String placeholder, TextInputType inputType) {
    return TextField(
      controller: placeholder == 'Name of the crop'
          ? _cropNameController
          : placeholder == 'Area spent on this crop in acres'
              ? _areaController
              : _plantCountController,
      decoration: InputDecoration(
        hintText: placeholder,
        border: OutlineInputBorder(),
      ),
      keyboardType: inputType,
    );
  }

  Widget _buildDropDown(String placeholder, List<String> options) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(placeholder),
          value: _selectedIrrigationMethod.isNotEmpty
              ? _selectedIrrigationMethod
              : null,
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              _selectedIrrigationMethod = value ?? '';
            });
          },
        ),
      ),
    );
  }
}