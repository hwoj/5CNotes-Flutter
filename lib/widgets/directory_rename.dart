import 'package:fivec_notes/models/directory.dart';
import 'package:flutter/material.dart';

/// This is a [StatefulWidget] dedicated to renaming a [Directory]
///
/// This [DirectoryRename] widget is called by the [DirectoryRow] or [OpenDocument] to rename the directory
class DirectoryRename extends StatefulWidget {

  /// The directory that is being renamed
  final Directory directory;

  /// The main constructor for the [DirectoryRename] widget
  ///
  /// This constructor passes a [Directory] into the widget
  const DirectoryRename({
    Key? key,
    required this.directory
  }) : super(key: key);

  @override
  State<DirectoryRename> createState() => DirectoryRenameState();
}

/// This is the main state of the [DirectoryRename] [StatefulWidget]
///
/// This state contains all of the widgets within the the [DirectoryRename] widget and the logic performed on actions
class DirectoryRenameState extends State<DirectoryRename> {

  /// The name that the user is renaming the directory to
  String ?name;

  /// This function validates the name the user wants to rename the directory to
  ///
  /// This function checks to see if the [newName] follows the allowed directory naming conventions and 
  /// returns a boolean that provides indication of if this is the case or not 
  bool validateName(String newName) {
    // make sure that the filename is alphanumeric but allowed to include spaces, underscores, hyphens or periods

    // return whether the above check was true or not
  }

  /// This is the function reponsible for renaming the directory given the user input
  ///
  /// It will change the name of the directory after validating it with [validateName]. 
  /// [newName] is the name being passed in
  void saveName(String newName) {
    // call validateName on the newName parameter

    // if validated then modify the directory object with the new name.
    // make call to directory service torename directory in backend.
    // close modal and widget

    // if not validated then display error and keep modal open

    // return
  }

  /// The function reponsible for closing the DirectoryRename
  ///
  /// This function will handle the logic for the DirectoryRename widget being closed if the user doesn't 
  /// want to proceed with renaming the directory
  void cancelRename() {
    // close modal and widget
  }

  @override
  Widget build(BuildContext context) {
    return Dialog();
  }
}

