import 'package:flutter/material.dart';

/// The class will be used to create a manage access 
/// modal page, which will be used to update permissions for a given file.
class ManageAccess extends StatelessWidget {
  /// Creates app instance of the ManageAccess modal page.
  /// 
  /// The modal page will control the sharing features.  
  /// Thus, it will have a text box to enter a user's email,
  /// along with a scroll-down menu to give them either read
  /// or write access.
  /// 
  /// params: [BuildContext] context
  /// return: [ShowDialogue] widget
  @override
  Widget build(BuildContext context) {

    /// The [ShowDialogue] widget will produce the modal
    /// screen. This screen will take the context [BuildContext] context
    /// and take a builder parameter, which will take an [AlertDialogue] widget.
    /// In the [AlertDialogue widget], there will be text editing controller defined 
    /// to allow a user to add another by typing their address.  It will also take a 
    /// [Scrollable] widget that will allow the user choose if someone gets read or write 
    /// access.  Finally, there must be a button defined such that updates permission.
    /// Finally, include a button that will close the modal page using the Navigation.of(context).pop()
    /// function.  
    return ShowDialogue();
  }
}

