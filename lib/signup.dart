import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'displayfarms.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController(); 
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  

  Future<void> _signUpWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      // Additional actions after successful signup
      print('User registered: ${userCredential.user?.email}');

      // Save user details to Firestore with the first 5 letters of the document name as the unique ID
      await _saveUserDetailsToFirestore(
        userCredential.user?.uid,
        fullNameController.text.trim(),
        emailController.text.trim(),
      );

      // Navigate to the DisplayFarms screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FarmsPage(),
        ),
      );
    } catch (e) {
      print('Error during email/password sign-up: $e');
      // Handle the error, for example, display an error message
    }
  }

  Future<void> _saveUserDetailsToFirestore(
      String? userId, String fullName, String email) async {
    try {
      // Extract the first 5 letters of the document name as the unique ID
      String uniqueId = userId!.substring(0, 6);

      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'fullName': fullName,
        'email': email,
        'uniqueId': uniqueId,
        // Add other user details as needed
      });

      print('User details saved to Firestore with Unique ID: $uniqueId');
    } catch (e) {
      print('Error saving user details to Firestore: $e');
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
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_circle,
                      size: 100.0, color: Colors.white),
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
                  _buildTextFieldWithLabel('Full Name', fullNameController),
                  _buildTextFieldWithLabel('Phone Number', phoneNumberController),
                  _buildTextFieldWithLabel('Email', emailController),
                  _buildTextFieldWithLabel('Password', passwordController),
                  
                  ElevatedButton(
                    onPressed: () async {
                      await _signUpWithEmailAndPassword(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffffffff),
                    ),
                    child: const Text('Continue',
                        style: TextStyle(color: Color(0xFF006227))),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigate to the login page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LoginPage(), // Replace LoginPage with the actual login page class
                        ),
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

  Widget _buildTextFieldWithLabel(
      String label, TextEditingController controller) {
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
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}
