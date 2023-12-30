import 'package:flutter/material.dart';
import 'displayfarms.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0EA73C), Color(0xFF12600B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // "Enter 4 digit verification code" text
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Enter 4 digit verification code\nsent to your registered mobile number.',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // "Enter OTP" text
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              // OTP TextFields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOtpTextField(),
                  _buildOtpTextField(),
                  _buildOtpTextField(),
                  _buildOtpTextField(),
                ],
              ),

              // Submit button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DisplayFarms()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffffffff),
                  ),
                  child: const Text('Submit',
                      style: TextStyle(color: Color(0xFF006227))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpTextField() {
    return Container(
      width: 35.0,
      height: 48.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
