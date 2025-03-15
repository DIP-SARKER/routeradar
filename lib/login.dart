import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:routeradar/schedule.dart';
import 'package:routeradar/signup_request_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = false;

  String path = "assets/eyeclose.json";

  void _togglePasswordVisibility() {
    setState(() {
      if (_obscureText) {
        path = "assets/eyeclose.json";
      } else {
        path = "assets/eyeopen.json";
      }
      _obscureText = !_obscureText;
    });
  }

  // void _login() {
  //   String email = _emailController.text;
  //   String password = _passwordController.text;

  //   // Add authentication logic here
  //   print('Logging in with email: $email and password: $password');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
              TextField(
                cursorColor: Theme.of(context).primaryColor,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email / Username / ID",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(FontAwesome.user_tie_solid, size: 20),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                cursorColor: Theme.of(context).primaryColor,
                controller: _passwordController,
                obscureText: !_obscureText,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(FontAwesome.key_solid, size: 18),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(height: 220),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Schedule()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white, fontSize: 14),
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
                        color: Colors.white,
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
    );
  }
}
