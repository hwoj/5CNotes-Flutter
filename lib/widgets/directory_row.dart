import 'package:fivec_notes/models/directory.dart';
import 'package:fivec_notes/models/file.dart';
import 'package:flutter/material.dart';

/// The [DirectoryRow] [StatefulWidget] is the widget responsible for an individual [Directory] in the [FileTree]
///
/// The [DirectoryRow] will contain the Directory name as well as a number of actions to rename, delete and expand/collapse. 
/// The [DirectoryRow] will also be a parent to a number of [FileRow] widgets that are dynamically rendered as the child 
/// [File] objects of the given [Directory] object
class DirectoryRow extends StatefulWidget {

  /// The [Directory] object that the [DirectoryRow] represents
  final Directory directory;

  /// The constructor for the [DirectoryRow] object
  /// 
  /// This is the default and only constructor for the [DirectoryRow] object
  const DirectoryRow({
    Key? key,
    required this.directory
  }) : super (key: key);

  @override
  State<DirectoryRow> createState() => DirectoryRowState();
}

/// This is the primary state of the [DirectoryRow] [StatefulWidget]
///
/// This state will contain all of the contents of the [DirectoryRow] widget along with the logic to handle actions performed on it. 
/// The primary subwidget being used is an [ExpansionTile] who's children are other rows of [FileRow] or [DirectoryRow]. 
/// The [renameDirectory] and [deleteDirectory] functions handle those actions respectively while the flutter [ExpansionTile] wiget 
/// has built in capabaility to perform the collapsing and expanding.
class DirectoryRowState extends State<DirectoryRow> {

  /// the files that exist in this directory
  List<File> files = [];

  /// the directories that exist in this directory
  List<Directory> subdirectories = [];

  /// The function responsible for handling the action to rename the [Directory] from the [DirectoryRow]
  ///
  /// This function will call on the [DirectoryRename] widget to rename the [Directory]
  renameDirectory() {
    // calls on the directory rename widget and passes the directory into it
    // DirectoryRename handles the rest!
  }

  /// The function responsible for handling the action to delete the [Directory] from the [DirectoryRow]
  ///
  /// This function will confirm whether the the [Directory] and all contents should be deleted and then 
  /// carry out the specified action
  deleteDirectory() {
    // Creates a popup to confirm if Directory and all contents should be deleted
    // if user presses no then return

    // if user presses yes then delete directory and contents on front end
    // also make call to directory to delete files and directory
  }

  /// The function responsible for creating a subdirectory within the [Directory]
  ///
  /// This function will allow the user to create a new directory that exists underneath the current [DirectoryRow]'s directory
  createSubDirectory() {
    // initialize barebones directory object

    // prompts user to input a name for the directory using DirectoryRename widget

    // adds directory to parent directory/parent course (whichever is the parent of this directory row)

    // call on directoryservice to add a new directory
  }

  /// The function responsible for creating a new [File] within the current [Directory]
  /// 
  /// This function will create a new [File] to be represented as a [FileRow] within the current [Directory] and [DirectoryRow]
  createSubFile() {
    // initialize barebones File object

    // prompt user for file name using the FileRename widget

    // add file to list of files in directory in UI

    // make call to backend to create file in persistent db
  }

  /// The [build] function creates the widget and the subwidgets it contains
  ///
  /// The primary child is the [ExpansionTile] which will contain all of the [DirectoryRow] widget's children
  @override
  Widget build(BuildContext context) {
    return const ExpansionTile(title: Title)
  }
}