import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'add3.dart';

class AddFarmsPage2 extends StatelessWidget {
  AddFarmsPage2({Key? key}) : super(key: key);

  late final TextEditingController _farmLandController =
      TextEditingController();
  late final TextEditingController _mangoAreaController =
      TextEditingController();
  late final TextEditingController _otherCropsAreaController =
      TextEditingController();

  Future<void> _saveFarmDetails(BuildContext context) async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Save farm details to Firestore under "FarmerDetails2" subcollection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('FarmerDetails2') // Change subcollection name here
          .add({
        'farmLandArea': _farmLandController.text,
        'mangoArea': _mangoAreaController.text,
        'otherCropsArea': _otherCropsAreaController.text,
      });

      // Navigate to the next page (MangoFarmDetailsPage or any other page)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddFarmPage3()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Farms',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff006e21),
      ),
      body: Container(
        color: const Color(0xFFD3FFA6),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please enter farm details here',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            _buildHyperlinkedText('Farm location', 'Choose location on maps'),
            _buildFormField(
                'Farm Land', 'Enter area in acres', _farmLandController),
            _buildFormField(
              'Area (Mangoes)',
              'Area spent on mango trees in acres',
              _mangoAreaController,
            ),
            _buildFormField(
              'Area (Other crops)',
              'Area spent on others in acres',
              _otherCropsAreaController,
            ),
            const SizedBox(height: 20.0),
            const SizedBox(height: 20.0),
            const SizedBox(height: 20.0),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _saveFarmDetails(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006227),
                ),
                child: const Text('Continue',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHyperlinkedText(String heading, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20.0),
        Text(
          heading,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5.0),
        GestureDetector(
          onTap: () {
            // Add functionality for tapping the hyperlinked text
          },
          child: Row(
            children: [
              const Icon(Icons.location_pin),
              const SizedBox(width: 5.0),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFormField(
      String heading, String placeholder, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20.0),
        Text(
          heading,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5.0),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: placeholder,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
