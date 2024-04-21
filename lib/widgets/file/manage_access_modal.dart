import 'package:fivec_notes/widgets/file/manage_access_dropdown.dart';
import 'package:flutter/material.dart';

  /// Creates app instance of the ManageAccess modal page.
  /// 
  /// The modal page will control the sharing features.  
  /// Thus, it will have a text box to enter a user's email,
  /// along with a scroll-down menu to give them either read
  /// or write access.
class ManageAccessModal extends StatefulWidget {

  
  State<ManageAccessModal> createState() => _ManageAccessModalState();
 
}
/// Instantiates the instance of of the Manage Access modal.
class _ManageAccessModalState extends State<ManageAccessModal> {

  /// Controller used to allow user to type email of recipient user to
  /// which the file will be shared. 
  TextEditingController _emailController = TextEditingController();

  /// Constructs the Modal using the [Dialogue] widget.
  ///
  /// The build method will return a [Dialogue] widget, which is the modal.
  /// The subwidgets of the modal will be displayed vertically in top-down order
  /// The modal displays a textbox to type the email of a recipient user,
  /// A dropdown to choose between read or write access.
  /// A button that will share the file upon being pressed.
  @override
  Widget build(BuildContext context) {
    
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          height: 200.0,
          width: 200.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Type in the email of desired user to give access to."),
                ),
              SizedBox(height: 16.0), // Space between widgets
              ManageAccessDropdown(),
              SizedBox(height: 16.0), // Space between widgets
              ElevatedButton(
                onPressed: () {
                  // TODO: Add document sharing functionality 
                  // need to send HTTP request and retrieve response from the backend
                }, 
                child: Text("Share")
                ),
            ],)
        )
      );
  }
  
  /// Dispose of email text controller
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}

