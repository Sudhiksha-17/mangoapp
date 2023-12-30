import 'package:flutter/material.dart';
import 'add3.dart';

class AddFarmsPage2 extends StatelessWidget {
  const AddFarmsPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Farms',
          style: TextStyle(color: Colors.white), // Text color
        ),
        backgroundColor: const Color(0xff006e21), // Background color
      ),
      body: Container(
        color: const Color(0xFFD3FFA6), // Background color #D3FFA6
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
            _buildFormField('Farm Land', 'Enter area in acres'),
            _buildFormField(
                'Area (Mangoes)', 'Area spent on mango trees in acres'),
            _buildFormField(
                'Area (Other crops)', 'Area spent on others in acres'),
            const SizedBox(height: 20.0),
            const SizedBox(height: 20.0),
            const SizedBox(height: 20.0),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MangoFarmDetailsPage()),
                  );
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

  Widget _buildFormField(String heading, String placeholder) {
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
          decoration: InputDecoration(
            hintText: placeholder,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
