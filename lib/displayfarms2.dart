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
  late String _area = '';
  late String _treeCount = '';
  late String _ageOfTrees = '';
  late String _selectedIrrigationMethod = '';
  late String _cropName = '';
  late String _areaUtilized = '';
  late String _countOfPlants = '';
  late String _selectedIrrigationMethodOtherPlant = '';

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
          _selectedMangoVariety = data?['mangoVariety'] ?? '';
          _area = data?['area'] ?? '';
          _treeCount = data?['treeCount'] ?? '';
          _ageOfTrees = data?['ageOfTrees'] ?? '';
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
          _cropName = data?['cropName'] ?? '';
          _area = data?['area'] ?? '';
          _countOfPlants = data?['plantCount'] ?? '';
          _selectedIrrigationMethodOtherPlant = data?['irrigationMethod'] ?? '';
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
        title: Text('Farm Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            const Divider(height: 1, color: Colors.black), // Horizontal line
            const SizedBox(height: 10),
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
            const Divider(height: 1, color: Colors.black), // Horizontal line
            const SizedBox(height: 10),
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
            const Divider(height: 1, color: Colors.black), // Horizontal line
            const SizedBox(height: 10),
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
            const Divider(height: 1, color: Colors.black), // Horizontal line
            const SizedBox(height: 10),
            DataDisplaySection(
              heading: 'Mango Variety 2',
              dataLabels: [
                'Mango Variety: $_selectedMangoVariety',
                'Area: $_area',
                'Tree Count: $_treeCount',
                'Age of Trees: $_ageOfTrees',
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 1, color: Colors.black), // Horizontal line
            const SizedBox(height: 10),
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
            const Divider(height: 1, color: Colors.black), // Horizontal line
            const SizedBox(height: 10),
            DataDisplaySection(
              heading: 'Other Plant Details 2',
              dataLabels: [
                'Crop Name: $_cropName',
                'Area: $_area',
                'Plant Count: $_countOfPlants',
                'Irrigation Method: $_selectedIrrigationMethodOtherPlant',
              ],
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
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the left
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
    );
  }
}
