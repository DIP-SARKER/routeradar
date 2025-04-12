import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/database/authentication.dart';
import 'package:routeradar/database/database.dart';
import 'package:routeradar/pages/homepage.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  // final TextEditingController _currentPasswordController =
  //     TextEditingController();

  // String _storedPassword = "";
  // bool _isCurrentPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    // _storedPassword = authServices.value.globalPassword;
    final name = await database.value.getUserinfo("name");
    final id = await database.value.getUserinfo("id");
    final phone = await database.value.getUserinfo("phone");

    setState(() {
      _usernameController.text = name;
      _studentIdController.text = id;
      _phoneController.text = phone;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneController.dispose();
    _studentIdController.dispose();
    // _currentPasswordController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      if (authServices.value.getCurrentUserUID() != null) {
        database.value.updateUserInfo(
          _usernameController.text,
          _phoneController.text,
          _studentIdController.text,
        );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Success",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  )),
              content: Text("Profile updated successfully",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              actions: [
                TextButton(
                  onPressed: () {
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
      } else {
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
                'An error occurred, Try again Later',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Try Again"),
                ),
              ],
            );
          },
        );
      }
      _usernameController.clear();
      _phoneController.clear();
      _studentIdController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(
                    FontAwesome.user_tie_solid,
                    size: 20,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _studentIdController,
                decoration: InputDecoration(
                  labelText: 'Student ID',
                  prefixIcon: Icon(Icons.badge),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your student ID';
                  }
                  return null;
                },
              ),
              // SizedBox(height: 30),
              // Divider(),
              // SizedBox(height: 12),
              // TextFormField(
              //   controller: _currentPasswordController,
              //   obscureText: !_isCurrentPasswordVisible,
              //   decoration: InputDecoration(
              //     labelText: 'Current Password',
              //     prefixIcon: Icon(Icons.lock_outline),
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12)),
              //     suffixIcon: IconButton(
              //       icon: Icon(
              //         _isCurrentPasswordVisible
              //             ? Icons.visibility
              //             : Icons.visibility_off,
              //       ),
              //       onPressed: () {
              //         setState(() {
              //           _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
              //         });
              //       },
              //     ),
              //   ),
              // ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Save Changes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
}
