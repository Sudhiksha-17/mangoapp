
/*

class MangoFarmDetailsPage2 extends StatelessWidget {
  MangoFarmDetailsPage2({super.key});

  final String _selectedMangoVariety = 'Kesar';
  late final TextEditingController _areaController = TextEditingController();
  late final TextEditingController _treeCountController =
      TextEditingController();
  late final TextEditingController _ageOfTreesController =
      TextEditingController();

  void _saveMangoVarietyDetails(BuildContext context) async {
    // Get the current user
    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Save mango variety details to Firestore under FarmDetails4 subsection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('FarmerDetails5') // Change subcollection name here
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
                'Please enter mango farm details here',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xff218f00),
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildSubHeading('Mango Variety'),
            SizedBox(height: 10),
            _buildDropDown(
                'Name of the mango variety',  ["Alphonso", "Amrapali", "Badmi", "Banganapalli", "Bangalore", "Chandrakaran", "Chausa", "Cheruku Rasalu", "Dasheri", "Fazli", "Gulab Khas", "Himsagar", "Imampasand", "Jardalu", "Kesar", "Kishen Bhog", "Lalbagh", "Langra", "Malda", "Mallika", "Mankad", "Mulgoba", "Neelum", "Pairi", "Rajapuri", "Ratna", "Rataul", "Rumali", "Sadabahar", "Saroli", "Suvarnarekha", "Totapuri", "Vanraj"]),
            SizedBox(height: 20),
            _buildSubHeading('Area of this variety'),
            SizedBox(height: 10),
            _buildTextField(
                'Area spent on this variety in acres', TextInputType.number),
            SizedBox(height: 20),
            _buildSubHeading('Count of trees in this variety'),
            SizedBox(height: 10),
            _buildTextField(
                'Number of trees of this variety', TextInputType.number),
            SizedBox(height: 20),
            _buildSubHeading('Age of trees'),
            SizedBox(height: 10),
            _buildTextField('Period since the trees are planted(in yrs/months)',
                TextInputType.text),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement continue button functionality
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MangoFarmDetailsPage1()));
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
import 'addmango2.dart';


class MangoFarmDetailsPage2 extends StatefulWidget {
  MangoFarmDetailsPage2({Key? key}) : super(key: key);

  @override
  _MangoFarmDetailsPage2State createState() => _MangoFarmDetailsPage2State();
}

class _MangoFarmDetailsPage2State extends State<MangoFarmDetailsPage2> {
  String _selectedMangoVariety = '';
  late final TextEditingController _areaController = TextEditingController();
  late final TextEditingController _treeCountController =
      TextEditingController();
  late final TextEditingController _ageOfTreesController =
      TextEditingController();

  void _saveMangoVarietyDetails(BuildContext context) async {
    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('FarmerDetails5')
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
                'Please enter mango farm details here',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xff218f00),
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildSubHeading('Mango Variety'),
            SizedBox(height: 10),
            _buildDropDown(
              'Name of the mango variety',
              [
                "Alphonso", "Amrapali", "Badmi", "Banganapalli", "Bangalore", "Chandrakaran", "Chausa", "Cheruku Rasalu", "Dasheri", "Fazli", "Gulab Khas", "Himsagar", "Imampasand", "Jardalu", "Kesar", "Kishen Bhog", "Lalbagh", "Langra", "Malda", "Mallika", "Mankad", "Mulgoba", "Neelum", "Pairi", "Rajapuri", "Ratna", "Rataul", "Rumali", "Sadabahar", "Saroli", "Suvarnarekha", "Totapuri", "Vanraj"
              ],
            ),
            SizedBox(height: 20),
            _buildSubHeading('Area of this variety'),
            SizedBox(height: 10),
            _buildTextField(
              'Area spent on this variety in acres',
              TextInputType.number,
            ),
            SizedBox(height: 20),
            _buildSubHeading('Count of trees in this variety'),
            SizedBox(height: 10),
            _buildTextField(
              'Number of trees of this variety',
              TextInputType.number,
            ),
            SizedBox(height: 20),
            _buildSubHeading('Age of trees'),
            SizedBox(height: 10),
            _buildTextField(
              'Period since the trees are planted(in yrs/months)',
              TextInputType.text,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MangoFarmDetailsPage1(),
                    ),
                  );
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
          value: _selectedMangoVariety.isNotEmpty ? _selectedMangoVariety : null,
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              _selectedMangoVariety = value ?? '';
            });
          },
        ),
      ),
    );
  }
}