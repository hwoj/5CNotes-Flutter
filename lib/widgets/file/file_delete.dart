import 'package:fivec_notes/models/file.dart';
import 'package:flutter/material.dart';

/// The [StatefulWidget] that handles file deletions
///
/// A wrapper around a [SimpleDialog] to handle/confirm the file deletion
class FileDelete extends StatefulWidget {

  /// The file being deleted
  final File file;

  /// The function called upon delete from [FileRow]
  final Function deleteFunc;

  /// Constructor for [FileDelete] 
  ///
  /// Will be called from the [FileRow] to pull up the modal
  const FileDelete({
    Key? key,
    required this.file,
    required this.deleteFunc
  });

  @override
  State<FileDelete> createState() => FileDeleteState();
}

/// Primary state of the widget
///
/// Contains all of the widgets and logic for rebuilding the state
class FileDeleteState extends State<FileDelete> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Delete ${widget.file.name}"),
      children: [],
    );
  }
}