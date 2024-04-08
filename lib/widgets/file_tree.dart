import 'package:fivec_notes/models/semester.dart';
import 'package:flutter/material.dart';

/// The [FileTree] is a [StatefulWidget] representing the entirety of the files that the user has access to
///
/// The [FileTree] will contain a listing of all the [Semester], [File] and [Directory] objects the user has access to. 
/// This will exist on the left side of the [HomeScreen] screen. It will allow users to select files to edit as well as 
/// perform actions on the files and directories
class FileTree extends StatefulWidget {

  @override
  State<FileTree> createState() => FileTreeState();
}

/// The [FileTreeState] represents the primary state of the [FileTree] widget
///
/// All the widgets that are used to compose the file tree will exist here, as well as any methods to alter the file tree. 
/// As with all states, the [build] method shows the creation of the widget
class FileTreeState extends State<FileTree> {


  /// This instance variable contains the semesters that the user has been enrolled in
  List<Semester> semesters = [];


  /// The initState function handles the logic to be run upon the first build of the [FileTreeState]
  ///
  /// This function calls the inherited initState function and then initializes the file tree by calling [initializeFileTree]
  @override
  void initState() {
    super.initState();

    initializeFileTree();
  }



  /// This function is reponsible for initializing the file tree by fetching it's contents
  ///
  /// It will call the [FileService] to get all the objects to populate the files for the current semester
  void initializeFileTree() {
    // call semester service to retrieve the semesters the user has been a part of
    // place semesters in semester list

    // call the course service to get a list of all the courses in the current semester
    // pass in the courses to the current semester object

    // retrieve directory and file tree
    // pass these into the semester for them to be appropriately displayed

    // retrieve contents of these files one by one starting with course most likely to be open
  }


  /// The [build] function is used to create the widget and its sub widgets and update it when changes happen to it
  ///
  /// The primary subwidget of the [build] function is the malleable [Container]. The [Container] will contain the semesters, their classes and then the 
  /// series of [DirectoryRow] and [FileRow] objects that are contained within a [ClassRow].
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}