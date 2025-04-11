import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:routeradar/database/authentication.dart';
import 'package:routeradar/database/database.dart';
import 'package:routeradar/pages/login.dart';
import 'dart:io';
import 'package:routeradar/pages/profileeditpage.dart';
import 'package:routeradar/widgets/customappbar.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  File? _image;
  String _name = "";
  String _id = "";

  @override
  void initState() {
    super.initState();
    database.value.getUserinfo("name").then((value) {
      setState(() {
        _name = value;
      });
    });
    database.value.getUserinfo("id").then((value) {
      setState(() {
        _id = value;
      });
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Profile & Settings",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 3.0,
                        ),
                      ),
                    ),
                    radius: 60,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : const AssetImage("assets/IMG.png") as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: IconButton(
                        icon: Icon(FontAwesome.camera_retro_solid,
                            color: Colors.white),
                        onPressed: _pickImage,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              _id,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            _buildSettingTile(Icons.people_alt_outlined, "Edit Profile", () {}),
            _buildSettingTile(
                Icons.notifications_none_sharp, "Notification Settings", () {}),
            _buildSettingTile(
                Icons.privacy_tip_outlined, "Privacy Settings", () {}),
            _buildSettingTile(Icons.help_outline, "Help & Support", () {}),
            _buildSettingTile(Icons.info_outline, "About App", () {}),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                side: BorderSide(color: Theme.of(context).primaryColor),
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: Icon(
                Icons.logout,
                size: 20,
              ),
              label: const Text(
                "Logout",
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                // Implement logout functionality here
                Get.defaultDialog(
                  title: "Logout",
                  middleText: "Are you sure you want to logout?",
                  confirm: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(250, 14, 9, 22),
                      foregroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                      authServices.value.signOut();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                      Get.snackbar(
                        "Logout",
                        "You have been logged out successfully.",
                        titleText: const Text(
                          "Logout",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        messageText: const Text(
                          "You have been logged out successfully.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.white,
                      );
                    },
                    child: const Text("Yes"),
                  ),
                  cancel: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("No"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Theme.of(context).primaryColor),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
      onTap: () {
        Get.to(
          () => EditProfilePage(),
          transition: Transition.fade,
          duration: Duration(milliseconds: 1300),
        );
      },
    );
  }
}
