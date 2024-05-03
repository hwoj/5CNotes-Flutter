import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/course.dart';
import 'package:fivec_notes/models/semester.dart';
import 'package:fivec_notes/services/api_services/filetree_service.dart';
import 'package:fivec_notes/widgets/course/add_course.dart';
import 'package:fivec_notes/widgets/filetree/course_row.dart';
import 'package:fivec_notes/widgets/open_document.dart';
import 'package:flutter/material.dart';

/// The [StatefulWidget] representing the [SemesterRow] top level object that composes the [FileTree]
///
/// An expandable/collapsable widget representing a given [Semester] that the student is enrolled in. 
/// This is the top level collapsable element in the filetree
class SemesterRow extends StatefulWidget {

  /// Whether the [SemesterRow] should begin in expanded state or not
  final bool isInitiallyExpanded;
  
  /// The [Semester] object that the [SemesterRow] is representing
  final Semester semester;

  /// The [GlobalKey] to alter the [OpenDocumentState]
  final GlobalKey<OpenDocumentState> docKey;

  /// The default constructor for the [SemesterRow]
  ///
  /// The constructor that will be used to pass in a [semester] to the [SemesterRow]
  const SemesterRow({
    super.key,
    required this.semester,
    this.isInitiallyExpanded = false,
    required this.docKey
  });

  @override
  State<SemesterRow> createState() => SemesterRowState();
}

/// The primary state of the [SemesterRow] [StatefulWidget]
/// 
/// This state encodes the contents of the [SemesterRow] and will update as necessary
class SemesterRowState extends State<SemesterRow> {
  
  /// Whether the row is expanded or not
  bool isExpanded = false;

  /// Whether the row is hovered or not
  bool isHovered = false;

  @override
  void initState() {
    super.initState();

    isExpanded = widget.semester.isCurrent;
    if (widget.semester.isCurrent) {
      loadSemester(widget.semester);
    }
    
  }

  /// This function will load the courses and files for a given semester
  /// 
  /// To enable lazy loading on old semesters. When an old semester is expanded, it will call this function to retrieve the 
  /// courses and their contents using the [FileService]
  void loadSemester(Semester semester) async {
    List<Course> courses = await FileTreeService.retrieveSemesterFileTree(semester);

    courses.forEach((course) {
      setState(() {
        widget.semester.courses.add(course);
      });
    });
  }

  void addCourse() {
    
  }

  void removeCourse(Course course) async {
    bool isDeleted = await FileTreeService.removeUserFromCourse(course);
    if (!isDeleted) {
      print("failed to remove course");
    }
    setState(() {
      widget.semester.courses.remove(course);
    });
  }

  /// The [build] method contains the widgets and content that makeup the [SemesterRow]
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
            hoverColor: Theme.of(context).appColors.backgroundRowHover,
            onHover: (hovered) {
              setState(() {
                isHovered = hovered;
              });
            },
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              
              padding: isHovered && widget.semester.isCurrent ? const EdgeInsets.symmetric(vertical: 3, horizontal: 10): const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                
                children: [
                  
                  Text(
                    widget.semester.name,
                    style: TextStyle(
                      color: Theme.of(context).appColors.textDefault
                    ),
                  ),
                  const Spacer(),
                  if (isHovered && widget.semester.isCurrent) ...[
                    IconButton(
                      padding: const EdgeInsets.all(2),
                      constraints: const BoxConstraints(),
                      onPressed: (){
                        // showDialog(
                        //   context: context, 
                        //   builder: (BuildContext context) {
                        //     return AddCourse(parentName: widget.semester.name, addFunc: addCourse);
                        //   }
                        // );
                      },
                      tooltip: "Add course",
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).appColors.textDefault,
                      ),
                      )
                  ],
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Theme.of(context).appColors.textDefault
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
                itemCount: widget.semester.courses.length,
                itemBuilder: (BuildContext context, int index) {
                  return CourseRow(course: widget.semester.courses[index], docKey: widget.docKey, deleteFunc: removeCourse);
                }
                ),
              
            ]
          )
        
      ],
      );
    // return ExpansionTile(
    //   title: Text(widget.semester.name),
    //   tilePadding: const EdgeInsets.symmetric(horizontal: 20),
    // );
  }
}