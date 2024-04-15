import 'package:flutter/material.dart';

/// The class to handle naming a new file that is being created
///
/// A wrapper around [SimpleDialog] to facilitate creating new files
class CreateFile extends StatefulWidget {

  /// The name of the parent course or directory
  final String parentName;

  /// The function in the parent course or directory to handle file creation
  final String createFunc;

  /// The constructor for the [CreateFile] class
  ///
  /// This constructor will be called from the row to create a new file
  const CreateFile({
    Key? key,
    required this.parentName,
    required this.createFunc
  }) : super (key: key);

  @override
  State<CreateFile> createState() => CreateFileState();
}

/// Primary state of the [CreateFile] class
///
/// This handles the creation of the widget and its contents as well as rebuilding them
class CreateFileState extends State<CreateFile> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      
    );
  }
}