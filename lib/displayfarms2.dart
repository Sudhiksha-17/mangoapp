import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Farm Details'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextBoxesSection(
                heading: 'Farm Details',
                textLabels: [
                  'Farm name',
                  'Phone number',
                  'Farm Address',
                  'Farm location',
                  'Farm Land',
                  'Area(Mangoes)',
                  'Area(Other crops)',
                ],
              ),
              const SizedBox(height: 10),
              const Divider(height: 1, color: Colors.black), // Horizontal line
              const SizedBox(height: 10),
              TextBoxesSection(
                heading: 'Mango Farm Details',
                textLabels: [
                  'Mango varieties',
                  'Count of mango trees',
                  'Irrigation Method',
                  'Yield in previous Year',
                  'Mango variety',
                  'Area of this variety',
                  'Count of trees in this variety',
                  'Age of trees',
                ],
              ),
              const SizedBox(height: 10),
              const Divider(height: 1, color: Colors.black), // Horizontal line
              const SizedBox(height: 10),
              TextBoxesSection(
                heading: 'Other Plants Details',
                textLabels: [
                  'Crop name',
                  'Area utilized',
                  'Count of plants',
                  'Irrigation method',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextBoxesSection extends StatelessWidget {
  final String heading;
  final List<String> textLabels;

  const TextBoxesSection({
    Key? key,
    required this.heading,
    required this.textLabels,
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
          children: textLabels
              .map(
                (label) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: label,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}