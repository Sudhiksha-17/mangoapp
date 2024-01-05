import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mangoapp/add1.dart';

class Farm {
  final String farmLandArea;
  final String mangoArea;
  final String numberOfVarieties;
  final String numberOfTrees;

  Farm({
    required this.farmLandArea,
    required this.mangoArea,
    required this.numberOfVarieties,
    required this.numberOfTrees,
  });
}

class FarmsPage extends StatefulWidget {
  @override
  _FarmsPageState createState() => _FarmsPageState();
}

class _FarmsPageState extends State<FarmsPage> {
  List<Farm> farms = [];

  @override
  void initState() {
    super.initState();
    _fetchFarmsData();
  }

  Future<void> _fetchFarmsData() async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        // User not authenticated, handle accordingly
        return;
      }

      farms.clear(); // Clear existing data

      // Fetch data from FarmerDetails2
      var farmerDetails2 = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('FarmerDetails2')
          .get();

      // Process FarmerDetails2 data and add to farms list
      for (var doc in farmerDetails2.docs) {
        farms.add(Farm(
          farmLandArea: doc['farmLandArea'],
          mangoArea: doc['mangoArea'],
          numberOfVarieties:
              '', // This data doesn't exist in FarmerDetails2, set accordingly
          numberOfTrees:
              '', // This data doesn't exist in FarmerDetails2, set accordingly
        ));
      }

      // Fetch data from FarmerDetails3
      var farmerDetails3 = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('FarmerDetails3')
          .get();

      // Process FarmerDetails3 data and add to farms list
      for (var doc in farmerDetails3.docs) {
        farms.add(Farm(
          farmLandArea:
              '', // This data doesn't exist in FarmerDetails3, set accordingly
          mangoArea:
              '', // This data doesn't exist in FarmerDetails3, set accordingly
          numberOfVarieties: doc['numberOfVarieties'],
          numberOfTrees: doc['numberOfTrees'],
        ));
      }

      // Update UI
      setState(() {});
    } catch (e) {
      print('Error fetching farms data: $e');
      // Handle the error, for example, display an error message
    }
  }

  Future<String> _generateFarmId(String userId) async {
    // Fetch the current farmId count and increment it by 1
    var snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('FarmDetails')
        .get();

    int farmCount = snapshot.docs.length + 1;
    String paddedCount = farmCount.toString().padLeft(3, '0');

    // Generate farmId by combining unique ID and 3-digit number
    String farmId = '${userId.substring(0, 6)}_$paddedCount';

    return farmId;
  }

  void _addFarm() async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        // User not authenticated, handle accordingly
        return;
      }

      // Generate farmId as a combination of unique ID and a 3-digit number
      String farmId = await _generateFarmId(user.uid);

      // Create an empty subfolder with the farmId under the user's document
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('FarmDetails')
          .doc(farmId)
          .set({});

      // Navigate to AddFarmsPage and wait for result
      var result = await Navigator.push<Farm>(
        context,
        MaterialPageRoute(builder: (context) => AddFarmsPage(farmId: farmId)),
      );

      // If result is not null (user added a farm), update farms list
      if (result != null) {
        farms.add(result);
        setState(() {});
      }
    } catch (e) {
      print('Error adding farm: $e');
      // Handle the error, for example, display an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farms App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Farms',
            style: TextStyle(color: Color(0xff054500)),
          ),
          backgroundColor: Color(0xffffc900),
        ),
        body: Container(
          color: Color(0xffffffff),
          child: Center(
            child: SizedBox(
              width: 200.0,
              child: ListView.builder(
                itemCount: farms.length,
                itemBuilder: (context, index) {
                  return _buildFarmBox(farms[index]);
                },
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addFarm,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildFarmBox(Farm farm) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Color(0xff218f00),
      child: ListTile(
        title: Text(
          'Farm Land Area: ${farm.farmLandArea}\nMango Area: ${farm.mangoArea}',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xffffffff)),
        ),
        subtitle: Text(
          'Varieties: ${farm.numberOfVarieties}\nTrees: ${farm.numberOfTrees}',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xffffffff)),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FarmsPage(),
  ));
}
