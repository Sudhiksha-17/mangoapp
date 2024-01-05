import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mangoapp/addfarm1.dart';
import 'login.dart';

/*
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
          actions: [
            // Add the sign-out button to the app bar
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(), // Replace with your login page
                  ),
                );
              },
            ),
            Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 12.0),
                ),
          ],
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
          onPressed: () {
            // Implement submit button functionality
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddFarmsPage()));
          },
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
*/


// Model representing farm details
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

// FarmsPage representing the list of farms
class FarmsPage extends StatefulWidget {
  @override
  _FarmsPageState createState() => _FarmsPageState();
}

class _FarmsPageState extends State<FarmsPage> {
  List<Farm> farms = []; // List to hold farm details

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
                    builder: (context) => LoginPage(), // Replace with your login page
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
            child: SizedBox(
              width: 200.0,
              child: ListView.builder(
                itemCount: farms.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(farm: farms[index]),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.all(8.0),
                      color: Color(0xff218f00),
                      child: ListTile(
                        title: Text(
                          'Farm Land Area: ${farms[index].farmLandArea}\nMango Area: ${farms[index].mangoArea}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xffffffff)),
                        ),
                        subtitle: Text(
                          'Varieties: ${farms[index].numberOfVarieties}\nTrees: ${farms[index].numberOfTrees}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xffffffff)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Implement submit button functionality
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddFarmsPage()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

// MyApp representing the detailed view of a specific farm
class MyApp extends StatelessWidget {
  final Farm farm;

  MyApp({required this.farm});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Farm Details')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Farm Land Area: ${farm.farmLandArea}'),
              Text('Mango Area: ${farm.mangoArea}'),
              // Display other details from the farm object as required
            ],
          ),
        ),
      ),
    );
  }
}

