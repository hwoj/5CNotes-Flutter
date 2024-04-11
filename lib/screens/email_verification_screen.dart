
import 'package:fivec_notes/screens/home_screen.dart';
import 'package:flutter/material.dart';

/// creates instance of an email verification page.
class EmailVerificationScreen extends StatefulWidget {
  // override createState method by making it instantiate an 
  // _Email VerificationState instance.
  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationState();
}

/// Creates the email verification page layout/features
class _EmailVerificationState extends State<EmailVerificationScreen> {

  // Instantiate text editing controller for the email verification text box. 
  TextEditingController _verificationController = TextEditingController();

  /// Creates the structure/layout fo the Email verification page.
  /// It should create a text box that will take the verification code.
  /// as input.
  @override
  Widget build(BuildContext context) {
    /// Use [Padding] widget for body parameter.
    /// Define its child to be [Column] widget.
    /// Define the children of the [Column] widget 
    /// to be the text controller.
    /// Instantiate an [ElevatedButton] button
    /// to enter the code, navigate to a new page if correct,
    /// else, prompt error message.
    return  Scaffold(
      appBar: AppBar(
        title: Text('Enter the 6-digit code sent to your email address'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _verificationController,
              decoration: InputDecoration(labelText: 'Enter the 6-digit code'),
            ),
            
            
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add signup logic here
                String code = _verificationController.text;

                if (code == "123456") {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => HomeScreen()));
                  // Implement signup logic here
                } else {
                  // Passwords don't match, show an error message
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Code is incorect'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }

  /// Removes controller for each verification code text box.
  void dispose() {   
    _verificationController.dispose();
    super.dispose();
  }
  
}