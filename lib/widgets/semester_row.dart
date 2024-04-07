import 'package:fivec_notes/models/semester.dart';
import 'package:flutter/material.dart';

/// The [StatefulWidget] representing the [SemesterRow] top level object that composes the [FileTree]
///
/// An expandable/collapsable widget representing a given [Semester] that the student is enrolled in. 
/// This is the top level collapsable element in the filetree
class SemesterRow extends StatefulWidget {
  
  /// The [Semester] object that the [SemesterRow] is representing
  final Semester semester;

  /// The default constructor for the [SemesterRow]
  ///
  /// The constructor that will be used to pass in a [semester] to the [SemesterRow]
  const SemesterRow({
    Key? key,
    required this.semester
  }) : super(key: key);

  @override
  State<SemesterRow> createState() => SemesterRowState();
}

/// The primary state of the [SemesterRow] [StatefulWidget]
/// 
/// This state encodes the contents of the [SemesterRow] and will update as necessary
class SemesterRowState extends State<SemesterRow> {
  
  /// This function will load the courses and files for a given semester
  /// 
  /// To enable lazy loading on old semesters. When an old semester is expanded, it will call this function to retrieve the 
  /// courses and their contents using the [FileService]
  void loadSemester(Semester semester) {

  }

  /// The [build] method contains the widgets and content that makeup the [SemesterRow]
  ///
  /// This method will be called everytime the state is updated to rebuild the State and widget
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(title: title);
  }
}