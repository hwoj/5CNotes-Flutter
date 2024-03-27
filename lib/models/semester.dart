import 'package:fivec_notes/models/course.dart';

/// The [Semester] class logically groups [Course] objects together into
///
/// This is the highest logical organization group in the 5CNotes filesystem
/// Past courses will be collapsed with the courses and other data being lazy loaded into them if they are uncollapsed
/// Files for past semesters also won't be saved on local disk or retrieved from the server when the app is booted in online mode
/// This is the lazy loading behavior

class Semester {
  
  /// The name of the semester (ie. 'Fall 2023')
  final String name;

  /// The list of [Course] objects that belong to this semester
  List<Course> courses = [];

  /// This is the only constructor for the semester object
  /// 
  /// [Semester] objects are front end only objects and so they will never be constructed from JSON
  /// For this reason this is the only constructor for them
  Semester({
    required this.name
  });



}