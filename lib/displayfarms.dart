import 'package:flutter/material.dart';
import 'login.dart';
import 'add1.dart'; // Import the AddFarms2Page file

class DisplayFarms extends StatelessWidget {
  const DisplayFarms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF006227),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ),
      body: Container(
        color: const Color(0xFFD3FFA6),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to the AddFarms2Page when the add icon is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddFarmsPage()),
                  );
                },
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF006227),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Add new Farm',
                style: TextStyle(
                  color: Color(0xFF006227),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
