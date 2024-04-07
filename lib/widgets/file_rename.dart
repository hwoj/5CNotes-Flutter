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

  }

  /// This is the function reponsible for renaming the file given the user input
  ///
  /// It will change the name of the file after validating it with [validateName]
  void saveName(String newName) {

  }

  /// The function reponsible for closing the FileRename
  ///
  /// This function will handle the logic for the FileRename widget being closed if the user doesn't 
  /// want to proceed with renaming the file
  void cancelRename() {

  }

  @override
  Widget build(BuildContext context) {
    return Dialog();
  }
}

