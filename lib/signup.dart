import 'package:flutter/material.dart';
import 'login.dart';
import 'main.dart';
import 'otp.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
        child: Stack(
          children: [
            // Top-left back button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  // Navigate back to the welcome page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomePage()),
                  );
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),

            // Center content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Personal account icon
                  const Icon(Icons.account_circle,
                      size: 100.0, color: Colors.white),

                  // "Sign up" text
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Full Name text and text field
                  _buildTextFieldWithLabel('Full Name'),

                  // Email text and text field
                  _buildTextFieldWithLabel('Email'),

                  // Mobile Number text and text field
                  _buildTextFieldWithLabel('Mobile Number'),

                  // Terms & Conditions text
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                    child: Text(
                      '* By signing up, you agree to our\nTerms & Conditions and Policies',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Continue button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the OTP screen on button press
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffffffff),
                    ),
                    child: const Text('Continue',
                        style: TextStyle(color: Color(0xFF006227))),
                  ),

                  // Already have an account? Log in hyperlink
                  InkWell(
                    onTap: () {
                      // Navigate to the login page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Already have an account? Log in',
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
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel(String label) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
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
