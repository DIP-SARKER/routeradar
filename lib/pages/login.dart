import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:routeradar/database/authentication.dart';
import 'package:routeradar/database/database.dart';
import 'package:routeradar/pages/homepage.dart';
import 'package:routeradar/pages/signup_request_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _showUserAgreement() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Terms and Conditions"),
          content: SingleChildScrollView(
            child: Text(
              "By using RouteRadar, you agree to abide by our Terms of Service and Privacy Policy. "
              "This includes the collection and use of your data to enhance user experience, "
              "provide location-based services, and improve app functionality. \n\n"
              "Key points of our agreement:\n\n"
              "■ Your personal data will be handled securely and will not be shared without your consent.\n"
              "■ You are responsible for the accuracy of the information you provide.\n"
              "■ Misuse of the app, including fraudulent activity, may result in account suspension.\n\n"
              "Please review our full User Agreement and Privacy Policy before proceeding.",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = false;
  bool isChecked = false;
  bool _isLoading = false;
  String path = "assets/jsons/eyeclose.json";

  void _togglePasswordVisibility() {
    setState(() {
      if (_obscureText) {
        path = "assets/jsons/eyeclose.json";
      } else {
        path = "assets/jsons/eyeopen.json";
      }
      _obscureText = !_obscureText;
    });
  }

  void clearControllers() {
    _emailController.clear();
    _passwordController.clear();
  }

  void _logIn() async {
    if (!isChecked) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("User Agreement Required"),
            content: SingleChildScrollView(
              child: Text(
                "To proceed, you must agree to the Terms and Conditions. "
                "By continuing, you acknowledge that you have read and understood our terms of service, "
                "including data collection and privacy policies.",
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isChecked = true;
                  });
                  Navigator.pop(context);
                },
                child: Text("I Agree"),
              ),
            ],
          );
        },
      );
    } else {
      if (_formKey.currentState!.validate()) {
        setState(() => _isLoading = true);

        try {
          await authServices.value.signIn(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
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
                content: Text(
                    "Successfully logged in as ${database.value.getUserinfo("name")}.",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                actions: [
                  TextButton(
                    onPressed: () {
                      clearControllers();
                      Navigator.of(context).pop();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()),
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
              children: [
                Lottie.asset(
                  path,
                  width: 300,
                  height: 200,
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon:
                        Icon(FontAwesome.envelope_open_text_solid, size: 20),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@diu.edu.bd')) {
                      return 'Please enter your valid email or ID';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  controller: _passwordController,
                  obscureText: !_obscureText,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FontAwesome.lock_solid, size: 18),
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
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 170),
                Center(
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _logIn,
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
                                'Log In',
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
                    Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),
                    Text(
                      "I agree to the",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: _showUserAgreement,
                      child: Text(
                        "Terms and Conditions.",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupRequestPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15,
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
