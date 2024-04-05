import 'package:fivec_notes/models/file.dart';
import 'package:flutter/material.dart';

/// The [FileRow] represents the listing of an individual file in the [FileTree]
///
/// It will exist as a child to a parent [FolderRow] and display the file name as well as action buttons. 
/// These buttons will exist for deleting the file, editing the file name and sharing the file. 
/// As a stateful widget its primary state is the [FileRowState] state.
class FileRow extends StatefulWidget {

  /// The file that the row will be representing
  final File file;


  /// This is the constructor for the [FileRow] that accepts the associated [File] as a parameter
  ///
  /// This constructor is implemented as constant because this is an immutable class. Immutable classes have only constant 
  /// (final) parameters
  const FileRow({
    Key? key,
    required this.file
  }) : super(key: key);

  @override
  State<FileRow> createState() => FileRowState();
}

/// The [FileRowState] comprises the main state of the [FileRow] [StatefulWidget].
///
/// The State will contain all the sub widgets of the widget and the functions for the actions.
/// The contents of the widget are in [build] while the main actions are [shareFile], [deleteFile], [renameFile] and [openFile]
class FileRowState extends State<FileRow> {
  /// This boolean variable keeps track of whether the [File] is open in the editor or not
  bool isOpen = false;

  /// This is the function responsible for sharing the [File] using the share button
  ///
  /// The function will call on the [ManageAccess] widget to allow the user to share the [File] with other people
  shareFile() {

  }

  /// This function is responsible for handling the button command to delete the [File]
  ///
  /// This function will first ask again if the [File] should be deleted and then proceed with the user's action
  deleteFile() {

  }

  /// This function is responsible for handling the button action to rename the [File]
  ///
  /// This function will call on a [FileRename] widget to handle the renaming of the file
  renameFile() {

  }

  /// This function is responsible for handling opening this [File] in the editor UI
  ///
  /// This file will take the contents of the file and throw them into 
  openFile() {

  }

  /// This is the [build] function for the [FileRow] and defines the contents of the widget
  ///
  /// The primary element of the Widget is the [ListTile] which already generally behaves in the desired manner
  @override
  Widget build(BuildContext context) {
    return ListTile();
  }
}