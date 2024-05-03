import 'package:fivec_notes/main.dart';

import 'package:fivec_notes/screens/login_screen.dart';
import 'package:flutter/material.dart';

/// The [ChangePassword] is a [StatefulWidget] that will handle all UI elements and interactions for signing up a [User]
/// 
/// This screen will be stateful so that it can handle the changes to the data that the user is inputting and update accordingly
class ChangePasswordScreen extends StatefulWidget {
  /// Create new instance of a _SingUpPageState
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

/// Monitors the state of the Signup page.
///  
/// Keeps track of information passed into the 
/// email, password, and confirm password textbox.
class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  /// create text editing controllers for the old password, new password, 
  /// and confirm new password fields.
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  /// creates the structure/layout of the page.  
  /// 
  /// This will include an old password, new password, and confirm new password text box, and a button to 
  /// submit the entered fields.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200.0, vertical: 15.0),
              child: TextField(
                key: const Key("old password"),
                controller: _oldPasswordController,
                decoration: const InputDecoration(labelText: 'Old Password'),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200.0, vertical: 15.0),
              child: TextField(
                key: const Key("new password"),
                controller: _newPasswordController,
                decoration: const InputDecoration(labelText: 'New Password'),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200.0, vertical: 15.0),
              child: TextField(
                key: const Key("confirm password"),
                controller: _confirmPasswordController,
                decoration: const InputDecoration(labelText: 'Confirm New Password'),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 16.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      color: Theme.of(context).appColors.backgroundDefault,
                      ),
                    ),
                  TextButton(
                    key: const Key("change password button"),
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                      foregroundColor: Theme.of(context).appColors.backgroundRow,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20)
                    ),
                    onPressed: () {
                      // Add change password logic here
                      String actualPassword = "password";
                      String oldPassword = _oldPasswordController.text;
                      String newPassword = _newPasswordController.text;
                      String confirmPassword = _confirmPasswordController.text;

                      if (newPassword == confirmPassword && oldPassword == actualPassword) {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                      } else if (newPassword == "" || confirmPassword == "" || oldPassword == "") {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            key: const Key("Change password empty field"),
                            title: const Text('Error'),
                            content: const Text('Please fill in one of the empty fields.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );

                      } else {
                        // Passwords don't match, show an error message
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            key: const Key("credentials do not match"),
                            title: const Text('Error'),
                            content: const Text('Passwords do not match or incorrect password was given.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: const Text('Confirm Change'),
            ),
                ]
              )
            ),
          ],
        ),
      ),
    );
  }

  /// Removes the old password, new password, and confirm new password 
  /// after the user exits the signup page
  @override
  void dispose() {

    /// call the dispose method on all three text editing controllers
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}