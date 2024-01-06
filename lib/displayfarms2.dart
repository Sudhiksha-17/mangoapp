import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DisplayPage(farmId: 'farmId'),
    );
  }
}

class DisplayPage extends StatefulWidget {
  final String farmId;

  const DisplayPage({Key? key, required this.farmId}) : super(key: key);

  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  late TextEditingController _farmNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _farmAddressController;
  late TextEditingController _farmLandController;
  late TextEditingController _mangoAreaController;
  late TextEditingController _otherCropsAreaController;
  late TextEditingController _locationDataController;
  late TextEditingController _numberOfVarietyController;
  late TextEditingController _numberOfTreesController;
  late TextEditingController _yieldController;
  late TextEditingController _selectedMangoVarietyController;
  late TextEditingController _areaController;
  late TextEditingController _treeCountController;
  late TextEditingController _ageOfTreesController;
  late TextEditingController _selectedIrrigationMethodController;
  late TextEditingController _cropNameController;
  late TextEditingController _areaUtilizedController;
  late TextEditingController _countOfPlantsController;
  late TextEditingController _selectedIrrigationMethodOtherPlantController;

  @override
  void initState() {
    super.initState();
    _farmNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _farmAddressController = TextEditingController();
    _farmLandController = TextEditingController();
    _mangoAreaController = TextEditingController();
    _otherCropsAreaController = TextEditingController();
    _locationDataController = TextEditingController();
    _numberOfVarietyController = TextEditingController();
    _numberOfTreesController = TextEditingController();
    _yieldController = TextEditingController();
    _selectedMangoVarietyController = TextEditingController();
    _areaController = TextEditingController();
    _treeCountController = TextEditingController();
    _ageOfTreesController = TextEditingController();
    _selectedIrrigationMethodController = TextEditingController();
    _cropNameController = TextEditingController();
    _areaUtilizedController = TextEditingController();
    _countOfPlantsController = TextEditingController();
    _selectedIrrigationMethodOtherPlantController = TextEditingController();

    _fetchFarmData();
  }

  Future<void> _fetchFarmData() async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        // User not authenticated, handle accordingly
        return;
      }

      String subfolder = 'users/${user.uid}/${widget.farmId}/';

      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance
              .collection(subfolder)
              .doc('FarmDetails1')
              .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        _farmNameController.text = data?['farmerName'] ?? '';
        _phoneNumberController.text = data?['phoneNumber'] ?? '';
        _farmAddressController.text = data?['farmAddress'] ?? '';
      } else {
        print('Farm data not found for farmId: ${widget.farmId}');
      }

      documentSnapshot = await FirebaseFirestore.instance
          .collection(subfolder)
          .doc('FarmerDetails2')
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        _farmLandController.text = data?['farmLandArea'] ?? '';
        _mangoAreaController.text = data?['mangoArea'] ?? '';
        _otherCropsAreaController.text = data?['otherCropsArea'] ?? '';
        //_locationDataController.text = data?['location'] != null
        //  ? _locationDataToJson(data?['location'])
        //: '';
      } else {
        print('FarmerDetails2 data not found for farmId: ${widget.farmId}');
      }

      documentSnapshot = await FirebaseFirestore.instance
          .collection(subfolder)
          .doc('FarmerDetails3')
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        _numberOfVarietyController.text = data?['numberOfVarieties'] ?? '';
        _numberOfTreesController.text = data?['numberOfTrees'] ?? '';
        _yieldController.text = data?['yieldInPreviousYear'] ?? '';
        _selectedMangoVarietyController.text = data?['mangoVariety'] ?? '';
        _areaController.text = data?['area'] ?? '';
        _treeCountController.text = data?['treeCount'] ?? '';
        _ageOfTreesController.text = data?['ageOfTrees'] ?? '';
        _selectedIrrigationMethodController.text =
            data?['irrigationMethod'] ?? '';
      } else {
        print('FarmerDetails3 data not found for farmId: ${widget.farmId}');
      }

      documentSnapshot = await FirebaseFirestore.instance
          .collection(subfolder)
          .doc('FarmerDetails4')
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        _selectedMangoVarietyController.text = data?['mangoVariety'] ?? '';
        _areaController.text = data?['area'] ?? '';
        _treeCountController.text = data?['treeCount'] ?? '';
        _ageOfTreesController.text = data?['ageOfTrees'] ?? '';
      } else {
        print('FarmerDetails4 data not found for farmId: ${widget.farmId}');
      }

      documentSnapshot = await FirebaseFirestore.instance
          .collection(subfolder)
          .doc('FarmerDetails5')
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        _selectedMangoVarietyController.text = data?['mangoVariety'] ?? '';
        _areaController.text = data?['area'] ?? '';
        _treeCountController.text = data?['treeCount'] ?? '';
        _ageOfTreesController.text = data?['ageOfTrees'] ?? '';
      } else {
        print('FarmerDetails5 data not found for farmId: ${widget.farmId}');
      }

      documentSnapshot = await FirebaseFirestore.instance
          .collection(subfolder)
          .doc('OtherPlantDetails1')
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        _cropNameController.text = data?['cropName'] ?? '';
        _areaUtilizedController.text = data?['areaUtilized'] ?? '';
        _countOfPlantsController.text = data?['countOfPlants'] ?? '';
        _selectedIrrigationMethodOtherPlantController.text =
            data?['irrigationMethod'] ?? '';
      } else {
        print('OtherPlantDetails1 data not found for farmId: ${widget.farmId}');
      }

      documentSnapshot = await FirebaseFirestore.instance
          .collection(subfolder)
          .doc('OtherPlantDetails2')
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        _cropNameController.text = data?['cropName'] ?? '';
        _areaController.text = data?['area'] ?? '';
        _countOfPlantsController.text = data?['plantCount'] ?? '';
        _selectedIrrigationMethodOtherPlantController.text =
            data?['irrigationMethod'] ?? '';
      } else {
        print('OtherPlantDetails2 data not found for farmId: ${widget.farmId}');
      }
    } catch (e) {
      print('Error fetching farm data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farm Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DataDisplaySection(
              heading: 'Farmer Details 1',
              dataLables: [
                'Farmer name',
                'Phone number',
                'Farm Address',
              ],
              controllers: [
                _farmNameController,
                _phoneNumberController,
                _farmAddressController,
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 1, color: Colors.black), // Horizontal line
            const SizedBox(height: 10),
            DataDisplaySection(
              heading: 'Farmer Details 2',
              dataLables: [
                'Farm Land',
                'Area(Mangoes)',
                'Area(Other crops)',
                'Location',
              ],
              controllers: [
                _farmLandController,
                _mangoAreaController,
                _otherCropsAreaController,
                _locationDataController,
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 1, color: Colors.black), // Horizontal line
            const SizedBox(height: 10),
            DataDisplaySection(
              heading: 'Mango Details',
              dataLables: [
                'Number of Varieties',
                'Number of Trees',
                'Yield in Previous Year',
                'Mango Variety',
                'Area',
                'Tree Count',
                'Age of Trees',
                'Irrigation Method',
              ],
              controllers: [
                _numberOfVarietyController,
                _numberOfTreesController,
                _yieldController,
                _selectedMangoVarietyController,
                _areaController,
                _treeCountController,
                _ageOfTreesController,
                _selectedIrrigationMethodController,
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 1, color: Colors.black), // Horizontal line
            const SizedBox(height: 10),
            DataDisplaySection(
              heading: 'Mango Variety 1',
              dataLables: [
                'Mango Variety',
                'Area',
                'Tree Count',
                'Age of Trees',
              ],
              controllers: [
                _selectedMangoVarietyController,
                _areaController,
                _treeCountController,
                _ageOfTreesController,
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 1, color: Colors.black), // Horizontal line
            const SizedBox(height: 10),
            DataDisplaySection(
              heading: 'Mango Variety 2',
              dataLables: [
                'Mango Variety',
                'Area',
                'Tree Count',
                'Age of Trees',
              ],
              controllers: [
                _selectedMangoVarietyController,
                _areaController,
                _treeCountController,
                _ageOfTreesController,
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 1, color: Colors.black), // Horizontal line
            const SizedBox(height: 10),
            DataDisplaySection(
              heading: 'Other Plant Details 1',
              dataLables: [
                'Crop Name',
                'Area Utilized',
                'Count of Plants',
                'Irrigation Method',
              ],
              controllers: [
                _cropNameController,
                _areaUtilizedController,
                _countOfPlantsController,
                _selectedIrrigationMethodOtherPlantController,
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 1, color: Colors.black), // Horizontal line
            const SizedBox(height: 10),
            DataDisplaySection(
              heading: 'Other Plant Details 2',
              dataLables: [
                'Crop Name',
                'Area',
                'Plant Count',
                'Irrigation Method',
              ],
              controllers: [
                _cropNameController,
                _areaController,
                _countOfPlantsController,
                _selectedIrrigationMethodOtherPlantController,
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  @override
  void dispose() {
    _farmNameController.dispose();
    _phoneNumberController.dispose();
    _farmAddressController.dispose();
    _farmLandController.dispose();
    _mangoAreaController.dispose();
    _otherCropsAreaController.dispose();
    _locationDataController.dispose();
    _numberOfVarietyController.dispose();
    _numberOfTreesController.dispose();
    _yieldController.dispose();
    _selectedMangoVarietyController.dispose();
    _areaController.dispose();
    _treeCountController.dispose();
    _ageOfTreesController.dispose();
    _selectedIrrigationMethodController.dispose();
    _cropNameController.dispose();
    _areaUtilizedController.dispose();
    _countOfPlantsController.dispose();
    _selectedIrrigationMethodOtherPlantController.dispose();
    super.dispose();
  }
}

class DataDisplaySection extends StatelessWidget {
  final String heading;
  final List<String> dataLables;
  final List<TextEditingController> controllers;

  const DataDisplaySection({
    Key? key,
    required this.heading,
    required this.dataLables,
    required this.controllers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: List.generate(
            dataLables.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: controllers[index],
                decoration: InputDecoration(
                  labelText: dataLables[index],
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
