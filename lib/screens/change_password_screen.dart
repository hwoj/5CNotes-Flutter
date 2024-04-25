import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/screens/email_verification_screen.dart';
import 'package:fivec_notes/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fivec_notes/screens/home_screen.dart';

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
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
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
                controller: _oldPasswordController,
                decoration: const InputDecoration(labelText: 'Old Password'),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200.0, vertical: 15.0),
              child: TextField(
                controller: _newPasswordController,
                decoration: const InputDecoration(labelText: 'New Password'),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200.0, vertical: 15.0),
              child: TextField(
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
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                      foregroundColor: Theme.of(context).appColors.backgroundRow,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20)
                    ),
                    onPressed: () {
                      // Add change password logic here
                      String oldPassword = _oldPasswordController.text;
                      String newPassword = _newPasswordController.text;
                      String confirmPassword = _confirmPasswordController.text;

                      if (newPassword == confirmPassword) {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                      } else {
                        // Passwords don't match, show an error message
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Error'),
                            content: const Text('Passwords do not match.'),
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