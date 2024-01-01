import 'package:flutter/material.dart';
import 'package:mangoapp/displayfarms.dart';
import 'signup.dart';
import 'otp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  late final TextEditingController _phoneNumberController =
      TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  Future<void> _signInWithPhoneNumber(BuildContext context) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phoneNumberController.text,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OtpScreen()),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Verification Failed: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OtpScreen()),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print('Error during phone number sign in: $e');
    }
  }

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DisplayFarms()),
      );
    } catch (e) {
      print('Error during email/password sign in: $e');
    }
  }

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
              const SizedBox(height: 50.0),
              const Icon(Icons.account_circle,
                  size: 100.0, color: Colors.white),
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
              _buildTextFieldWithLabel(
                'Enter your Mobile number',
                controller: _phoneNumberController,
              ),
              _buildTextFieldWithLabel(
                'Enter your Email',
                controller: _emailController,
              ),
              _buildTextFieldWithLabel(
                'Enter your Password',
                controller: _passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_phoneNumberController.text.isNotEmpty) {
                    _signInWithPhoneNumber(context);
                  } else if (_emailController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    _signInWithEmailAndPassword(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffffffff),
                ),
                child: const Text('Continue',
                    style: TextStyle(color: Color(0xFF006227))),
              ),
              const SizedBox(height: 20.0),
              InkWell(
                onTap: () {
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

  Widget _buildTextFieldWithLabel(
    String label, {
    TextEditingController? controller,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 25.0,
            ),
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: label,
              hintStyle: const TextStyle(color: Colors.white70),
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: const TextStyle(color: Colors.white),
            obscureText: isPassword,
          ),
        ],
      ),
    );
  }
}
