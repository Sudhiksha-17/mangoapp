import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mangoapp/add5.dart';
import 'package:mangoapp/add6.dart';

class MangoFarmDetailsPage1 extends StatefulWidget {
  final String farmId;

  MangoFarmDetailsPage1({required this.farmId, Key? key}) : super(key: key);

  @override
  _MangoFarmDetailsPage1State createState() => _MangoFarmDetailsPage1State();
}

class _MangoFarmDetailsPage1State extends State<MangoFarmDetailsPage1> {
  String selectedOption = '';
  String newVariety = '';
  int varietyCount = 1; // Track the number of mango varieties

  late final TextEditingController _areaController = TextEditingController();
  late final TextEditingController _treeCountController =
      TextEditingController();
  late final TextEditingController _ageOfTreesController =
      TextEditingController();
  late final TextEditingController _newVarietyController =
      TextEditingController();

  Future<void> _saveMangoVarietyDetails(BuildContext context) async {
    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String subfolder = 'users/${user.uid}/${widget.farmId}/';

      // Check if the folder for the current mango variety exists
      String varietyFolder = 'mangovariety$varietyCount';
      DocumentSnapshot<Map<String, dynamic>> varietySnapshot =
          await FirebaseFirestore.instance
              .collection(subfolder)
              .doc('FarmerDetails4')
              .collection(varietyFolder)
              .doc('details')
              .get();

      // If the folder exists, increment the varietyCount and create a new folder
      while (varietySnapshot.exists) {
        varietyCount++;
        varietyFolder = 'mangovariety$varietyCount';
        varietySnapshot = await FirebaseFirestore.instance
            .collection(subfolder)
            .doc('FarmerDetails4')
            .collection(varietyFolder)
            .doc('details')
            .get();
      }

      String varietyToSave = selectedOption.isNotEmpty
          ? selectedOption
          : (newVariety.isNotEmpty ? newVariety : '');

      await FirebaseFirestore.instance
          .collection(subfolder)
          .doc('FarmerDetails4')
          .collection(varietyFolder)
          .doc('details')
          .set({
        'mangoVariety': varietyToSave,
        'area': _areaController.text,
        'treeCount': _treeCountController.text,
        'ageOfTrees': _ageOfTreesController.text,
      });

      // Display saved details on console
      print('Mango Variety: $varietyToSave');
      print('Area: ${_areaController.text}');
      print('Tree Count: ${_treeCountController.text}');
      print('Age of Trees: ${_ageOfTreesController.text}');
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
            _buildDropDown('Name of the mango variety', [
              "ALPHONSO",
              "ATHIMATHURAM",
              "BANGANAPALLI",
              "CHERUKURASAM",
              "CHAUSA",
              "DEUGAD ALPHONSO",
              "DHASERI",
              "HIMAM PASAND",
              "JAHANGIR",
              "JAWARI",
              "KALAPADI",
              "KESAR",
              "KOPPUR BANGANAPALLI",
              "KOPPUR KALAPADI",
              "KOPPUR RUMAN",
              "LANGRA",
              "MALLIKA",
              "MALGOVA",
              "MALIHABADI DHASHERI",
              "NEELAM",
              "PANCHAVARNAM",
              "PATTANI GOVA",
              "PEDDHA RASAL",
              "PETHER",
              "RATHNAGIRI ALPHONSO",
              "RUMANI",
              "SENDHURA",
              "SWARNAREKHA",
              "TOTAPURI/ BANGAWRA",
              "VADU MANGAI",
              "Others", // Added "Others" option
            ]),
            if (selectedOption == "Others") ...[
              SizedBox(height: 10),
              _buildTextField(
                'Enter the name of the new mango variety',
                TextInputType.text,
                _newVarietyController,
              ),
            ],
            SizedBox(height: 20),
            _buildSubHeading('Area of this variety'),
            SizedBox(height: 10),
            _buildTextField(
              'Area spent on this variety in acres',
              TextInputType.number,
              _areaController,
            ),
            SizedBox(height: 20),
            _buildSubHeading('Count of trees in this variety'),
            SizedBox(height: 10),
            _buildTextField(
              'Number of trees of this variety',
              TextInputType.number,
              _treeCountController,
            ),
            SizedBox(height: 20),
            _buildSubHeading('Age of trees'),
            SizedBox(height: 10),
            _buildTextField(
              'Period since the trees are planted(in yrs/months)',
              TextInputType.text,
              _ageOfTreesController,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Save details to Firebase when tapped
                newVariety = _newVarietyController.text;
                _saveMangoVarietyDetails(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MangoFarmDetailsPage2(
                        farmId: widget
                            .farmId), // Replace YourNewPage with the actual page you want to navigate to
                  ),
                );
              },
              child: Text(
                '+ Add variety',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _saveMangoVarietyDetails(context);
                  newVariety = _newVarietyController.text;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OtherPlantsDetailsPage(farmId: widget.farmId),
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

  Widget _buildTextField(String placeholder, TextInputType inputType,
      TextEditingController controller) {
    return TextField(
      controller: controller,
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
          value: selectedOption.isNotEmpty ? selectedOption : null,
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              selectedOption = value ?? '';
            });
          },
        ),
      ),
    );
  }
}
