import 'package:flutter/material.dart';
import 'add4.dart';

class MangoFarmDetailsPage2 extends StatelessWidget {
  const MangoFarmDetailsPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff006e21),
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
                'Please enter mango farm details here',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSubHeading('Mango Variety'),
            const SizedBox(height: 10),
            _buildDropDown(
                'Name of the mango variety', ['Kesar', 'Alphonso', 'Malgova']),
            const SizedBox(height: 20),
            _buildSubHeading('Area of this variety'),
            const SizedBox(height: 10),
            _buildTextField(
                'Area spent on this variety in acres', TextInputType.number),
            const SizedBox(height: 20),
            _buildSubHeading('Count of trees in this variety'),
            const SizedBox(height: 10),
            _buildTextField(
                'Number of trees of this variety', TextInputType.number),
            const SizedBox(height: 20),
            _buildSubHeading('Age of trees'),
            const SizedBox(height: 10),
            _buildTextField('Period since the trees are planted(in yrs/months)',
                TextInputType.text),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement continue button functionality
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MangoFarmDetailsPage1()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006227),
                ),
                child:
                    const Text('Save', style: TextStyle(color: Colors.white)),
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
