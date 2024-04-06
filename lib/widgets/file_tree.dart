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

class FileTreeState extends State<FileTree> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}