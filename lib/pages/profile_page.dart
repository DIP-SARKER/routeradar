import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile & Settings"),
        centerTitle: true,
        toolbarHeight: 100,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
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
                    backgroundImage: AssetImage("assets/IMG.png"),
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
                        onPressed: () {},
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
            _buildSettingTile(Icons.lock_open, "Change Password", () {}),
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
    );
  }

  Widget _buildSettingTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Theme.of(context).primaryColor),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
      onTap: () {},
    );
  }
}
