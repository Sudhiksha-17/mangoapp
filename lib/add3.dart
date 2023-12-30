import 'package:flutter/material.dart';
import 'add4.dart';

class MangoFarmDetailsPage extends StatelessWidget {
  const MangoFarmDetailsPage({super.key});

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
                'Please enter mango farm details here',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSubHeading('Mango Varieties'),
            const SizedBox(height: 10),
            _buildTextField('Number of mango variety', TextInputType.number),
            const SizedBox(height: 20),
            _buildSubHeading('Count of Mango Trees'),
            const SizedBox(height: 10),
            _buildTextField('Number of mango tree', TextInputType.number),
            const SizedBox(height: 20),
            _buildSubHeading('Irrigation Method'),
            const SizedBox(height: 10),
            _buildDropDown(
              'Method of irrigation',
              ['Drip irrigation', 'Sprinkler irrigation', 'Surface irrigation'],
            ),
            const SizedBox(height: 20),
            _buildSubHeading('Yield in Previous Year'),
            const SizedBox(height: 10),
            _buildTextField(
                'Yield of mangoes in the previous year', TextInputType.number),
            const SizedBox(height: 20),
            const SizedBox(height: 20.0),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //MangoFarmDetailsPage1
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MangoFarmDetailsPage1()),
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
