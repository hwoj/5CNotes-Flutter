import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/course.dart';
import 'package:fivec_notes/models/directory.dart';
import 'package:fivec_notes/widgets/directory_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  Directory dir = Directory(uuid: "1234", name: "Some Folder", parent: ".", user: "1234", course: "123");
  
  /// whether the dropdown is expanded or not
  bool isExpanded = false;

  /// whether the row is hovered or not
  bool isHovered = false;

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
        Material(
          color: Theme.of(context).appColors.backgroundRow,
          child: InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            onHover: (hovered) {
              setState(() {
                isHovered = hovered;
              });
            },
            hoverColor: Theme.of(context).appColors.backgroundDarkerComponent,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 10),
              child: Row(
          
                children: [
                  
                  Text(
                    widget.course.name,
                    style: TextStyle(color: Theme.of(context).appColors.textDefault),
                    ),
                  const Spacer(),
                  if (isHovered) ...[
                    Icon(
                      Icons.create_new_folder_outlined,
                      color: Theme.of(context).appColors.textDefault,
                    ),
                    Icon(
                      Icons.add,
                      color: Theme.of(context).appColors.textDefault,
                    ),
                  ],
                    
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isExpanded) 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return DirectoryRow(directory: dir);
                }
              )
            ],
          )
        
      ],
      );
   
  }
}