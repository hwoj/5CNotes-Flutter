import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/screens/home_screen.dart';
import 'package:fivec_notes/screens/signup_screen.dart';
import 'package:flutter/material.dart';

/// The [LoginScreen] widget is a [StatefulWidget] that is responsible for the application login processes
/// 
/// This screen will validate user input and update accordingly while communicating with the REST API
class LoginScreen extends StatefulWidget {

  // Overload createState() method to return an instance
  // of a [_LoginPageState]
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

/// Stores the various states of a login page
/// In this case, it refers to the information typed
/// in the email and password fields. 
class LoginScreenState extends State<LoginScreen> {

  // Initialize username and password text editing controller 
  // to take the user input.
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// Takes the information of the parent widget and 
  /// return a [Scaffold], which defines the structure, layout,
  /// color of the login page features
  @override
  Widget build(BuildContext context) {
    /// The [Scaffold] widget takes in two parameters:
    /// appBar and body
    /// Define and [AppBar] widget to label the title for the appBar
    /// Define a [Padding] widget for the body.
    /// The [Padding] widget will have subfields that will define the 
    /// structure of the UI.
    /// Use EdgeInsets.all() to define margin offsets.
    /// Define a [Column] field for the child field:
    /// The [Column] widget will have two textfields and a button 
    /// defined for its children.  
    /// Use the onPressed() function and use Navigation.of(context).push
    /// to navigate the user to the main page if their password is correct.
    /// Else, Tell them that their password is incorrect.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              key: const Key("Email text box"),
              padding: const EdgeInsets.symmetric(horizontal: 200.0, vertical: 15.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ),
            Padding(
              key: const Key("Password text box"),
              padding: const EdgeInsets.symmetric(horizontal: 200.0, vertical: 15.0),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 30.0),
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
                      key: const Key("Login button"),
                      style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                      foregroundColor: Theme.of(context).appColors.backgroundRow,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20)
                      ), 
                    onPressed: () {
                      // Add authentication logic here
                      String email = emailController.text;
                      String password = passwordController.text;
                      // dummy values for correct email and password, will change later 
                      String correctEmail = "email";
                      String correctPassword = "password"; 
                      if (email == correctEmail && password == correctPassword) { 
                        final homescreenRoute = MaterialPageRoute(builder: (_) => HomeScreen());
                        Navigator.pushAndRemoveUntil(context, homescreenRoute, ModalRoute.withName("/home"));
                      } else { // Display modal if email or password is incorrect
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            key: const Key("Incorrect email or password modal"),
                            title: const Text('Error'),
                            content: const Text('Either username or password is incorrect.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // dismiss modal
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: const Text('Login'),
            ),
                  ],
                )
            ),
            const SizedBox(height: 30),
          TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 10),
              ),
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: const Text('Do not have an account yet?  Sign up here!'),
            ),
          ],
        ),
      ),
    );
  }
  /// Remove the password and email controller once one exits 
  /// the login page
  @override
  void dispose() {
    // Call the dispose method on the username and password
    // text editing controller.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}