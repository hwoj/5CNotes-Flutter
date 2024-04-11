import 'package:fivec_notes/models/course.dart';
import 'package:flutter/material.dart';

/// The [StatefulWidget] representing the [CourseRow] top level object that composes the [FileTree]
///
/// An expandable/collapsable widget representing a given [Course] that the student is enrolled in. 
/// This is the top level collapsable element in the filetree
class CourseRow extends StatefulWidget {
  
  /// The [Course] object that the [CourseRow] is representing
  final Course course;

  /// The default constructor for the [CourseRow]
  ///
  /// The constructor that will be used to pass in a [course] to the [CourseRow]
  const CourseRow({
    Key? key,
    required this.course
  }) : super(key: key);

  @override
  State<CourseRow> createState() => CourseRowState();
}

/// The primary state of the [CourseRow] [StatefulWidget]
/// 
/// This state encodes the contents of the [CourseRow] and will update as necessary
class CourseRowState extends State<CourseRow> {
  
  /// whether the dropdown is expanded or not
  bool isExpanded = false;

  /// This function will load the courses and files for a given course
  /// 
  /// To enable lazy loading on old courses. When an old course is expanded, it will call this function to retrieve the 
  /// courses and their contents using the [FileService]
  void loadCourse(Course course) {

  }

  /// The [build] method contains the widgets and content that makeup the [CourseRow]
  ///
  /// This method will be called everytime the state is updated to rebuild the State and widget
  @override
  Widget build(BuildContext context) {
    
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 10),
            child: Row(

              children: [
                
                Text(widget.course.name),
                const Spacer(),
                Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more
                ),
              ],
            ),
          ),
        ),
        if (isExpanded) 
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("HELLO WORLD")],
          )
        
      ],
      );
   
  }
}