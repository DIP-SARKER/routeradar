import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController =
      TextEditingController(text: 'John Doe');
  final TextEditingController _phoneController =
      TextEditingController(text: '01700000000');
  final TextEditingController _studentIdController =
      TextEditingController(text: '12345678');
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  // Simulated current password (in real apps, never store passwords like this)
  String _storedPassword = 'mypassword123';

  // Boolean flags to manage password visibility
  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      if (_currentPasswordController.text.isNotEmpty ||
          _newPasswordController.text.isNotEmpty) {
        if (_currentPasswordController.text == _storedPassword) {
          setState(() {
            _storedPassword = _newPasswordController.text;
          });
          _showSnackBar('Profile & Password updated successfully');
        } else {
          _showSnackBar('Current password is incorrect');
          return;
        }
      } else {
        _showSnackBar('Profile updated successfully');
      }

      _currentPasswordController.clear();
      _newPasswordController.clear();
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String validatorMsg,
    IconData? icon,
    bool isObscure = false,
    TextInputType keyboardType = TextInputType.text,
    bool isPasswordField = false,
    bool isPasswordVisible = false,
    VoidCallback? togglePasswordVisibility,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure && !isPasswordVisible,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        suffixIcon: isPasswordField
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: togglePasswordVisibility,
              )
            : null,
      ),
      validator: (value) {
        if (validatorMsg.isNotEmpty && (value == null || value.isEmpty)) {
          return validatorMsg;
        }
        return null;
      },
    );
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
              _buildTextField(
                label: 'Username',
                controller: _usernameController,
                validatorMsg: 'Please enter your username',
                icon: Icons.person,
              ),
              SizedBox(height: 20),
              _buildTextField(
                label: 'Phone Number',
                controller: _phoneController,
                validatorMsg: 'Please enter a valid phone number',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              _buildTextField(
                label: 'Student ID',
                controller: _studentIdController,
                validatorMsg: 'Please enter your student ID',
                icon: Icons.badge,
              ),
              SizedBox(height: 30),
              Divider(),
              Text(
                'Change Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 12),
              _buildTextField(
                label: 'Current Password',
                controller: _currentPasswordController,
                validatorMsg: '',
                icon: Icons.lock_outline,
                isObscure: true,
                isPasswordField: true,
                isPasswordVisible: _isCurrentPasswordVisible,
                togglePasswordVisibility: () {
                  setState(() {
                    _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                  });
                },
              ),
              SizedBox(height: 16),
              _buildTextField(
                label: 'New Password',
                controller: _newPasswordController,
                validatorMsg: '',
                icon: Icons.lock,
                isObscure: true,
                isPasswordField: true,
                isPasswordVisible: _isNewPasswordVisible,
                togglePasswordVisibility: () {
                  setState(() {
                    _isNewPasswordVisible = !_isNewPasswordVisible;
                  });
                },
              ),
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
