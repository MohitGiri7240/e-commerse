import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/otpverification.dart';

class WelcomeBackScreen extends StatefulWidget {
  @override
  _WelcomeBackScreenState createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool isLoading = false;

  // Function to validate phone number and navigate to OTP screen
  Future<void> _navigateToOtpScreen() async {
    if (_phoneController.text.length == 10) {
      setState(() => isLoading = true);

      try {
        // Firebase Phone Authentication
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: "${_phoneController.text}",
          verificationCompleted: (PhoneAuthCredential credential) async {
            // Automatically signs in when verification completes
            await FirebaseAuth.instance.signInWithCredential(credential);
            setState(() => isLoading = false);
          },
          verificationFailed: (FirebaseAuthException error) {
            setState(() => isLoading = false);
            log(error.message ?? "Verification failed");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Verification failed: ${error.message}")),
            );
          },
          codeSent: (String verificationId, int? resendToken) {
            setState(() => isLoading = false);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPVerificationScreen(verificationId: verificationId),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            log("Auto retrieval timeout");
          },
        );
      } catch (e) {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("An error occurred. Please try again.")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid 10-digit phone number.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Image.asset(
                'assets/splash.png',
                height: 140,
                width: 140,
              ),
              const SizedBox(height: 10),
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Login to continue",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(211, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone, color: Colors.grey),
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _navigateToOtpScreen,
                      child: const Text(
                        "Get OTP",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                      ),
                    ),
              const SizedBox(height: 60),
              const Text(
                "or Continue with",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialLoginButton(
                    imagePath: 'assets/facebookbutton.png',
                    label: "Facebook",
                    onPressed: () {
                      // Handle Facebook sign-in logic
                    },
                  ),
                  const SizedBox(width: 20),
                  _buildSocialLoginButton(
                    imagePath: 'assets/Google.png',
                    label: "Google",
                    onPressed: () {
                      // Handle Google sign-in logic
                    },
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for Social Login Button
  Widget _buildSocialLoginButton({required String imagePath, required String label, required VoidCallback onPressed}) {
    return Column(
      children: [
        MaterialButton(
          onPressed: onPressed,
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          shape: const CircleBorder(),
          child: Image.asset(
            imagePath,
            height: 30,
            width: 30,
          ),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.black)),
      ],
    );
  }
}
