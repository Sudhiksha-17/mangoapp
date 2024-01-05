
/*
class OtherPlantsDetailsPage extends StatelessWidget {
  OtherPlantsDetailsPage({super.key});

  final TextEditingController _cropNameController = TextEditingController();
  final TextEditingController _areaUtilizedController = TextEditingController();
  final TextEditingController _countOfPlantsController =
      TextEditingController();
  String _selectedIrrigationMethod = 'Drip irrigation';

  Future<void> _saveCropDetails(BuildContext context) async {
    // Get the current user
    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Save crop details to Firestore under OtherPlantsDetails subsection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('OtherPlantsDetails') // Change subcollection name here
          .add({
        'cropName': _cropNameController.text,
        'areaUtilized': _areaUtilizedController.text,
        'countOfPlants': _countOfPlantsController.text,
        'irrigationMethod': _selectedIrrigationMethod,
      });
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
            Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MangoFarmDetailsPage1()));
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
            GestureDetector(
              onTap: () {
                // Navigation logic to the next page for adding crops
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OtherPlantsDetailsPage2()));
              },
              child: Text(
                '+ Add crop',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement submit button functionality
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UploadScreen()));
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
import 'package:mangoapp/uploadimage.dart';
import 'addnewcrop.dart'; // Import OtherPlantsDetailsPage2 if not already done
import 'farmsuccess.dart'; // Import FarmAddedSuccessPage if not already done
import 'addmango2.dart';

class OtherPlantsDetailsPage extends StatefulWidget {
  OtherPlantsDetailsPage({Key? key}) : super(key: key);

  @override
  _OtherPlantsDetailsPageState createState() => _OtherPlantsDetailsPageState();
}

class _OtherPlantsDetailsPageState extends State<OtherPlantsDetailsPage> {
  final TextEditingController _cropNameController = TextEditingController();
  final TextEditingController _areaUtilizedController = TextEditingController();
  final TextEditingController _countOfPlantsController =
      TextEditingController();
  String _selectedIrrigationMethod = '';

  Future<void> _saveCropDetails(BuildContext context) async {
    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('OtherPlantsDetails')
          .add({
        'cropName': _cropNameController.text,
        'areaUtilized': _areaUtilizedController.text,
        'countOfPlants': _countOfPlantsController.text,
        'irrigationMethod': _selectedIrrigationMethod,
      });
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MangoFarmDetailsPage1(),
              ),
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
              'Area spent on this crop in acres',
              TextInputType.number,
            ),
            SizedBox(height: 20),
            _buildSubHeading('Count of Plants'),
            SizedBox(height: 10),
            _buildTextField(
              'Number of plants of this crop',
              TextInputType.number,
            ),
            SizedBox(height: 20),
            _buildSubHeading('Irrigation Method'),
            SizedBox(height: 10),
            _buildDropDown(
              'Method of irrigation',
              ['Drip irrigation', 'Sprinkler irrigation', 'Surface irrigation'],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtherPlantsDetailsPage2(),
                  ),
                );
              },
              child: Text(
                '+ Add crop',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UploadScreen(),
                    ),
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
              ? _areaUtilizedController
              : _countOfPlantsController,
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