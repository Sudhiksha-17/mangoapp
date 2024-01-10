import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mangoapp/add1.dart';
import 'package:mangoapp/displayfarms2.dart';
import 'package:mangoapp/login.dart';

class FarmsPage extends StatefulWidget {
  @override
  _FarmsPageState createState() => _FarmsPageState();
}

class _FarmsPageState extends State<FarmsPage> {
  List<String> farmIds = [];
  static int farmCount = 1;

  @override
  void initState() {
    super.initState();
    _loadFarmIds();
  }

  void _loadFarmIds() async {
    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      var snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('FarmDetails')
          .doc('farmIds')
          .get();

      if (snapshot.exists) {
        setState(() {
          farmIds = List<String>.from(snapshot.data()?['ids'] ?? []);
        });
      }
    }
  }

  void _saveFarmIds() async {
    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('FarmDetails')
          .doc('farmIds')
          .set({'ids': farmIds});
    }
  }

  Future<String> _generateFarmId(String userId) async {
    var snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('FarmDetails')
        .doc('farmIds')
        .get();

    print('Snapshot contents: ${snapshot.data()}');

    List<String> farmIds = List<String>.from(snapshot.data()?['ids'] ?? []);

    if (farmIds.isNotEmpty) {
      farmCount = int.parse(farmIds.last.split('_')[1]) + 1;
    }

    String farmId =
        '${userId.substring(0, 6)}_${farmCount.toString().padLeft(3, '0')}';

    print('Incremented Farm ID: $farmId'); // Print farmId to console

    return farmId;
  }

  void _addFarm() async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        return; // Handle the case when the user is not authenticated
      }

      String farmId = await _generateFarmId(user.uid);

      setState(() {
        farmIds.add(farmId);
      });

      // Save farmIds to Firestore
      _saveFarmIds();

      // Create an empty subfolder with the farmId under the user's document
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('FarmDetails')
          .doc(farmId)
          .set({});

      // Navigate to AddFarmsPage with the generated farmId
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddFarmsPage(farmId: farmId),
        ),
      );
    } catch (e) {
      print('Error adding farm: $e');
      // Handle the error, for example, display an error message
    }
  }

  void _navigateToFarmPage(String farmId) async {
    // Load farm details from Firestore
    DocumentSnapshot farmSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('FarmDetails')
        .doc(farmId)
        .get();

    if (farmSnapshot.exists) {
      // Navigate to DisplayPage with the selected farmId and farm details
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayPage(farmId: farmId),
        ),
      );
    } else {
      print('Farm data not found for farmId: $farmId');
    }
  }

  void _removeFarmBox(String farmId) {
    setState(() {
      farmIds.removeWhere((id) => id == farmId);
    });
    _saveFarmIds(); // Save the updated farmIds to Firestore after deletion
  }

  // void _editFarmBox(String farmId) {
  //   // Navigate to EditFarmPage with the selected farmId
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => AddFarmsPage(farmId: farmId),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farms App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Farms', style: TextStyle(color: Color(0xff054500))),
          backgroundColor: Color(0xffffc900),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>
                        LoginPage(), // Replace with your login page
                  ),
                );
              },
            ),
            Text('Sign Out', style: TextStyle(fontSize: 12.0)),
          ],
        ),
        body: Container(
          color: Color(0xffffffff),
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: _addFarm,
                  child: Text('Add Farm'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: farmIds.length,
                    itemBuilder: (context, index) {
                      return _buildFarmBox(farmIds[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFarmBox(String farmId) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Color(0xff218f00),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                _navigateToFarmPage(farmId);
              },
              child: Text('Farm ID: $farmId'),
            ),
            // IconButton(
            //   icon: Icon(Icons.edit),
            //   onPressed: () {
            //     _editFarmBox(farmId);
            //   },
            // ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _removeFarmBox(farmId);
              },
            ),
          ],
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
