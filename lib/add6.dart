import 'package:flutter/material.dart';
import 'add7.dart';
import 'add8.dart';

class OtherPlantsDetailsPage extends StatelessWidget {
  const OtherPlantsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF006227),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: const Color(0xFFD3FFA6),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Please enter details about other plants here',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSubHeading('Crop Name'),
            const SizedBox(height: 10),
            _buildTextField('Name of the crop', TextInputType.text),
            const SizedBox(height: 20),
            _buildSubHeading('Area Utilized'),
            const SizedBox(height: 10),
            _buildTextField(
                'Area spent on this crop in acres', TextInputType.number),
            const SizedBox(height: 20),
            _buildSubHeading('Count of Plants'),
            const SizedBox(height: 10),
            _buildTextField(
                'Number of plants of this crop', TextInputType.number),
            const SizedBox(height: 20),
            _buildSubHeading('Irrigation Method'),
            const SizedBox(height: 10),
            _buildDropDown(
              'Method of irrigation',
              ['Drip irrigation', 'Sprinkler irrigation', 'Surface irrigation'],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Navigation logic to the next page for adding crops
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OtherPlantsDetailsPage2()));
              },
              child: const Text(
                '+ Add crop',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement submit button functionality
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FarmAddedSuccessPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006227),
                ),
                child:
                    const Text('Submit', style: TextStyle(color: Colors.white)),
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
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTextField(String placeholder, TextInputType inputType) {
    return TextField(
      decoration: InputDecoration(
        hintText: placeholder,
        border: const OutlineInputBorder(),
      ),
      keyboardType: inputType,
    );
  }

  Widget _buildDropDown(String placeholder, List<String> options) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
