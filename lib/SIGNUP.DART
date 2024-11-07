import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // Email validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Mobile validation
  String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    final mobileRegex = RegExp(r'^[0-9]{10}$');
    if (!mobileRegex.hasMatch(value)) {
      return 'Please enter a valid 10-digit mobile number';
    }
    return null;
  }

  // Password validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password should be at least 6 characters long';
    }
    return null;
  }

  // Repeat password validation
  String? validateRepeatPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please repeat your password';
    }
    if (_passwordController.text != value) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Handle "Next" button press
  void onNextPressed() {
    if (_formKey.currentState!.validate()) {
      print("Sign-Up successful!");

      // Navigate to the next screen after successful validation
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NextScreen()), // Replace with your actual next screen
      );
    } else {
      print("Validation failed!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 100),
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(211, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 60),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: validateEmail,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  validator: validateMobile,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  validator: validatePassword,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _repeatPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Repeat Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  validator: validateRepeatPassword,
                ),
                SizedBox(height: 60),
                ElevatedButton(
                  onPressed: onNextPressed,
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                    backgroundColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "or Continue with",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            // Add Facebook login functionality here
                          },
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          shape: CircleBorder(),
                          child: Image.asset(
                            'assets/facebookbutton.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Facebook", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            // Add Google login functionality here
                          },
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          shape: CircleBorder(),
                          child: Image.asset(
                            'assets/Google.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Google", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Screen')),
      body: Center(child: Text('Welcome to the Next Screen!')),
    );
  }
}
