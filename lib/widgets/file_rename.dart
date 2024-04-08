import 'package:fivec_notes/models/file.dart';
import 'package:flutter/material.dart';

/// This is a [StatefulWidget] dedicated to renaming a [File]
///
/// This [FileRename] widget is called by the [FileRow] or [OpenDocument] to rename the file
class FileRename extends StatefulWidget {

  /// The file that is being renamed
  final File file;

  /// The main constructor for the [FileRename] widget
  ///
  /// This constructor passes a [File] into the widget
  const FileRename({
    Key? key,
    required this.file
  }) : super(key: key);

  @override
  State<FileRename> createState() => FileRenameState();
}

/// This is the main state of the [FileRename] [StatefulWidget]
///
/// This state contains all of the widgets within the the [FileRename] widget and the logic performed on actions
class FileRenameState extends State<FileRename> {

  /// The name that the user is renaming the file to
  String ?name;

  /// This function validates the name the user wants to rename the file to
  ///
  /// This function checks to see if the [newName] follows the allowed file naming conventions and 
  /// returns a boolean that provides indication of if this is the case or not 
  bool validateName(String newName) {
    // makesure that the newName string contains valid filename characters (using regex)

    // return whether this is the case or not
  }

  /// This is the function reponsible for renaming the file given the user input
  ///
  /// It will change the name of the file after validating it with [validateName]
  void saveName(String newName) {
    // call validateName to make sure the name is correct

    // if validated then update name of file object locally
    // push change to server
    // close modal and widget

    // if not validated then show error message and keep modal open

    // return
  }

  /// The function reponsible for closing the FileRename
  ///
  /// This function will handle the logic for the FileRename widget being closed if the user doesn't 
  /// want to proceed with renaming the file
  void cancelRename() {
    // close modal and widget
  }

  /// The build function contains the contents of the state
  ///
  /// this function will handle the creation and recreation of the state
  @override
  Widget build(BuildContext context) {
    // will contain a dialog with a text input area and 2 buttons
    // 1 button for closing the widget, another for submitting the rename
    return Dialog();
  }
}

