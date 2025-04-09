import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:routeradar/pages/profileeditpage.dart';
import 'package:routeradar/widgets/bnavbar.dart';
import 'package:routeradar/widgets/customappbar.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  File? _image;

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
            const Text(
              "XX XXXX XXXX",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "221-15-XXXX",
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
              onPressed: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
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
