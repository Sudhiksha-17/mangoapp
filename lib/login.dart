import 'package:flutter/material.dart';
import 'signup.dart';
import 'otp.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0), // Space at the top
              // Personal account icon
              const Icon(Icons.account_circle,
                  size: 100.0, color: Colors.white),

              // "Log in to your account" text
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Log in to your account',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20.0),
              // "Enter your Mobile number" text and text field
              _buildTextFieldWithLabel('Enter your Mobile number'),

              const SizedBox(height: 20.0),
              // Continue button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OtpScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffffffff),
                ),
                child: const Text('Continue',
                    style: TextStyle(color: Color(0xFF006227))),
              ),

              const SizedBox(height: 20.0), // Additional space below the button

              // Don't have an account? Sign up hyperlink
              InkWell(
                onTap: () {
                  // Navigate to the signup page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel(String label) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400, // Semi-bold
              fontSize: 25.0,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: label,
              hintStyle: const TextStyle(color: Colors.white70),
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
