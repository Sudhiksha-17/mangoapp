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
  late String _farmName = '';
  late String _phoneNumber = '';
  late String _farmAddress = '';
  late String _farmLand = '';
  late String _mangoArea = '';
  late String _otherCropsArea = '';
  late String _locationData = '';
  late String _numberOfVariety = '';
  late String _numberOfTrees = '';
  late String _yield = '';
  late String _selectedMangoVariety = '';
  late String _selectedMangoVariety2 = '';
  late String _area = '';
  late String _area2 = '';
  late String _treeCount = '';
  late String _treeCount2 = '';
  late String _ageOfTrees = '';
  late String _ageOfTrees2 = '';
  late String _selectedIrrigationMethod = '';
  late String _cropName = '';
  late String _areaUtilized = '';
  late String _countOfPlants = '';
  late String _selectedIrrigationMethodOtherPlant = '';
  late String _cropName2 = '';
  late String _areaUtilized2 = '';
  late String _countOfPlants2 = '';
  late String _selectedIrrigationMethodOtherPlant2 = '';

  @override
  void initState() {
    super.initState();
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
        setState(() {
          _farmName = data?['farmerName'] ?? '';
          _phoneNumber = data?['phoneNumber'] ?? '';
          _farmAddress = data?['farmAddress'] ?? '';
        });
      } else {
        print('Farm data not found for farmId: ${widget.farmId}');
      }

      documentSnapshot = await FirebaseFirestore.instance
          .collection(subfolder)
          .doc('FarmerDetails2')
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        setState(() {
          _farmLand = data?['farmLandArea'] ?? '';
          _mangoArea = data?['mangoArea'] ?? '';
          _otherCropsArea = data?['otherCropsArea'] ?? '';
          //_locationData = data?['location'] != null
          //  ? _locationDataToJson(data?['location'])
          //: '';
        });
      } else {
        print('FarmerDetails2 data not found for farmId: ${widget.farmId}');
      }

      documentSnapshot = await FirebaseFirestore.instance
          .collection(subfolder)
          .doc('FarmerDetails3')
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        setState(() {
          _numberOfVariety = data?['numberOfVarieties'] ?? '';
          _numberOfTrees = data?['numberOfTrees'] ?? '';
          _selectedIrrigationMethod = data?['irrigationMethod'] ?? '';
          _yield = data?['yieldInPreviousYear'] ?? '';
        });
      } else {
        print('FarmerDetails3 data not found for farmId: ${widget.farmId}');
      }

      documentSnapshot = await FirebaseFirestore.instance
          .collection(subfolder)
          .doc('FarmerDetails4')
          .collection("mangovareity1")
          .doc("details")
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        setState(() {
          _selectedMangoVariety = data?['mangoVariety'] ?? '';
          _area = data?['area'] ?? '';
          _treeCount = data?['treeCount'] ?? '';
          _ageOfTrees = data?['ageOfTrees'] ?? '';
        });
      } else {
        print('FarmerDetails4 data not found for farmId: ${widget.farmId}');
      }

      documentSnapshot = await FirebaseFirestore.instance
          .collection(subfolder)
          .doc('FarmerDetails5')
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        setState(() {
          _selectedMangoVariety2 = data?['mangoVariety'] ?? '';
          _area2 = data?['area'] ?? '';
          _treeCount2 = data?['treeCount'] ?? '';
          _ageOfTrees2 = data?['ageOfTrees'] ?? '';
        });
      } else {
        print('FarmerDetails5 data not found for farmId: ${widget.farmId}');
      }

      documentSnapshot = await FirebaseFirestore.instance
          .collection(subfolder)
          .doc('OtherPlantDetails1')
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        setState(() {
          _cropName = data?['cropName'] ?? '';
          _areaUtilized = data?['areaUtilized'] ?? '';
          _countOfPlants = data?['countOfPlants'] ?? '';
          _selectedIrrigationMethodOtherPlant = data?['irrigationMethod'] ?? '';
        });
      } else {
        print('OtherPlantDetails1 data not found for farmId: ${widget.farmId}');
      }

      documentSnapshot = await FirebaseFirestore.instance
          .collection(subfolder)
          .doc('OtherPlantDetails2')
          .get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        setState(() {
          _cropName2 = data?['cropName'] ?? '';
          _areaUtilized2 = data?['area'] ?? '';
          _countOfPlants2 = data?['plantCount'] ?? '';
          _selectedIrrigationMethodOtherPlant2 =
              data?['irrigationMethod'] ?? '';
        });
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
        backgroundColor: Color(0xffffc900),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xff054500),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Farm Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Visibility(
              visible: _farmName.isNotEmpty ||
                  _phoneNumber.isNotEmpty ||
                  _farmAddress.isNotEmpty,
              child: Column(
                children: [
                  DataDisplaySection(
                    heading: 'Farmer Details 1',
                    dataLabels: [
                      'Farmer name: $_farmName',
                      'Phone number: $_phoneNumber',
                      'Farm Address: $_farmAddress',
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                      height: 1, color: Colors.black), // Horizontal line
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Visibility(
              visible: _farmLand.isNotEmpty ||
                  _mangoArea.isNotEmpty ||
                  _otherCropsArea.isNotEmpty ||
                  _locationData.isNotEmpty,
              child: Column(
                children: [
                  DataDisplaySection(
                    heading: 'Farmer Details 2',
                    dataLabels: [
                      'Farm Land: $_farmLand',
                      'Area(Mangoes): $_mangoArea',
                      'Area(Other crops): $_otherCropsArea',
                      'Location: $_locationData',
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                      height: 1, color: Colors.black), // Horizontal line
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Visibility(
              visible: _numberOfVariety.isNotEmpty ||
                  _numberOfTrees.isNotEmpty ||
                  _selectedIrrigationMethod.isNotEmpty ||
                  _yield.isNotEmpty,
              child: Column(
                children: [
                  DataDisplaySection(
                    heading: 'Mango Details',
                    dataLabels: [
                      'Number of Varieties: $_numberOfVariety',
                      'Number of Trees: $_numberOfTrees',
                      'Irrigation Method: $_selectedIrrigationMethod',
                      'Yield in Previous Year: $_yield',
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                      height: 1, color: Colors.black), // Horizontal line
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Visibility(
              visible: _selectedMangoVariety.isNotEmpty ||
                  _area.isNotEmpty ||
                  _treeCount.isNotEmpty ||
                  _ageOfTrees.isNotEmpty,
              child: Column(
                children: [
                  DataDisplaySection(
                    heading: 'Mango Variety 1',
                    dataLabels: [
                      'Mango Variety: $_selectedMangoVariety',
                      'Area: $_area',
                      'Tree Count: $_treeCount',
                      'Age of Trees: $_ageOfTrees',
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                      height: 1, color: Colors.black), // Horizontal line
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Visibility(
              visible: _selectedMangoVariety2.isNotEmpty ||
                  _area2.isNotEmpty ||
                  _treeCount2.isNotEmpty ||
                  _ageOfTrees2.isNotEmpty,
              child: Column(
                children: [
                  DataDisplaySection(
                    heading: 'Mango Variety 2',
                    dataLabels: [
                      'Mango Variety: $_selectedMangoVariety2',
                      'Area: $_area2',
                      'Tree Count: $_treeCount2',
                      'Age of Trees: $_ageOfTrees2',
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                      height: 1, color: Colors.black), // Horizontal line
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Visibility(
              visible: _cropName.isNotEmpty ||
                  _areaUtilized.isNotEmpty ||
                  _countOfPlants.isNotEmpty ||
                  _selectedIrrigationMethodOtherPlant.isNotEmpty,
              child: Column(
                children: [
                  DataDisplaySection(
                    heading: 'Other Plant Details 1',
                    dataLabels: [
                      'Crop Name: $_cropName',
                      'Area Utilized: $_areaUtilized',
                      'Count of Plants: $_countOfPlants',
                      'Irrigation Method: $_selectedIrrigationMethodOtherPlant',
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                      height: 1, color: Colors.black), // Horizontal line
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Visibility(
              visible: _cropName2.isNotEmpty ||
                  _areaUtilized2.isNotEmpty ||
                  _countOfPlants2.isNotEmpty ||
                  _selectedIrrigationMethodOtherPlant2.isNotEmpty,
              child: Column(
                children: [
                  DataDisplaySection(
                    heading: 'Other Plant Details 2',
                    dataLabels: [
                      'Crop Name: $_cropName2',
                      'Area Utilized: $_areaUtilized2',
                      'Plant Count: $_countOfPlants2',
                      'Irrigation Method: $_selectedIrrigationMethodOtherPlant2',
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                      height: 1, color: Colors.black), // Horizontal line
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataDisplaySection extends StatelessWidget {
  final String heading;
  final List<String> dataLabels;

  const DataDisplaySection({
    Key? key,
    required this.heading,
    required this.dataLabels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              dataLabels.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  dataLabels[index],
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
