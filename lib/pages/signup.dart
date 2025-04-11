import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/database/database.dart';
import 'package:routeradar/pages/login.dart';
import 'package:routeradar/database/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  bool _obscureText = false;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void clearControllers() {
    _emailController.clear();
    _passwordController.clear();
    _nameController.clear();
    _phoneController.clear();
    _idController.clear();
    _confirmpasswordController.clear();
  }

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        await authServices.value.createAccount(
          email: _emailController.text,
          password: _passwordController.text,
        );

        await database.value.addUser(
          _nameController,
          _emailController,
          _idController,
          _phoneController,
        );
      } on FirebaseAuthException catch (e) {
        setState(() => _isLoading = false);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Failed!",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  )),
              content: Text(
                e.message ?? 'An error occurred',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text("Try Again"),
                ),
              ],
            );
          },
        );
        return;
      }

      // Replace this with your auth logic
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Success",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  )),
              content: Text("Sign up successful!",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              actions: [
                TextButton(
                  onPressed: () {
                    clearControllers();
                    authServices.value.signOut();
                    Navigator.of(context).pop();
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesome.user_tie_solid, size: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Student Email',
                    border: OutlineInputBorder(),
                    prefixIcon:
                        Icon(FontAwesome.envelope_open_text_solid, size: 20),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@diu.edu.bd')) {
                      return 'Email must include @diu.edu.bd';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  controller: _phoneController,
                  maxLength: 11,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (value) {
                    if (value == null || value.length != 11) {
                      return 'Enter a valid phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  controller: _idController,
                  decoration: InputDecoration(
                    labelText: 'Student ID',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.badge, size: 24),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ID cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  obscureText: !_obscureText,
                  maxLength: 24,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outlined, size: 25),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  obscureText: !_obscureText,
                  controller: _confirmpasswordController,
                  maxLength: 24,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock, size: 25),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.length < 6 ||
                        value != _passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 100),
                Center(
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: SizedBox(
                      height: 24, // Fixed height to accommodate text and loader
                      width: 120, // Set width based on your text length
                      child: Center(
                        child: _isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
