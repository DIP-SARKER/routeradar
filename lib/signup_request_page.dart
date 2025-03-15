import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:routeradar/login_request_page.dart';

class SignupRequestPage extends StatefulWidget {
  const SignupRequestPage({super.key});

  @override
  State<SignupRequestPage> createState() => _SignupRequestPage();
}

class _SignupRequestPage extends State<SignupRequestPage> {
  bool isChecked = false;

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

  Widget _buildAuthButton(IconData icon, String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(width: 1, color: Theme.of(context).primaryColor),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 40),
          leading: Icon(icon, size: 23, color: Colors.white),
          title: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          onTap: () {
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
              onTap();
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset(
              'assets/animation.json',
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
            Text(
              "Sign Up for RouteRadar",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            _buildAuthButton(
              FontAwesome.id_card_clip_solid,
              "Continue with ID",
              () {
                //3
              },
            ),
            _buildAuthButton(
              FontAwesome.google_brand,
              "Continue with Google",
              () {
                //3
              },
            ),
            _buildAuthButton(
              FontAwesome.user_tie_solid,
              "Use email or username",
              () {
                //3
              },
            ),
            SizedBox(height: 140),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: isChecked,
                  activeColor: Theme.of(context).primaryColor,
                  checkColor: Colors.white,
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
                  "Already have an account?",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginRequestPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Log In",
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
    );
  }
}
