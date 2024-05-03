import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/course.dart';
import 'package:fivec_notes/models/directory.dart';
import 'package:fivec_notes/models/file.dart';
import 'package:fivec_notes/services/api_services/filetree_service.dart';
import 'package:fivec_notes/widgets/course/remove_course.dart';
import 'package:fivec_notes/widgets/directory/add_directory.dart';
import 'package:fivec_notes/widgets/file/create_file.dart';
import 'package:fivec_notes/widgets/filetree/directory_row.dart';
import 'package:fivec_notes/widgets/filetree/file_row.dart';
import 'package:fivec_notes/widgets/open_document.dart';
import 'package:flutter/material.dart';

/// The [StatefulWidget] representing the [CourseRow] top level object that composes the [FileTree]
///
/// An expandable/collapsable widget representing a given [Course] that the student is enrolled in. 
/// This is the top level collapsable element in the filetree
class CourseRow extends StatefulWidget {
  
  /// The [Course] object that the [CourseRow] is representing
  final Course course;

  /// The [GlobalKey] to alter the [OpenDocumentState]
  final GlobalKey<OpenDocumentState> docKey;

  final Function(Course) deleteFunc;

  /// The default constructor for the [CourseRow]
  ///
  /// The constructor that will be used to pass in a [course] to the [CourseRow]
  CourseRow({
    super.key,
    required this.docKey,
    required this.course,
    required this.deleteFunc
  });

  @override
  State<CourseRow> createState() => CourseRowState();
}

/// The primary state of the [CourseRow] [StatefulWidget]
/// 
/// This state encodes the contents of the [CourseRow] and will update as necessary
class CourseRowState extends State<CourseRow> {


  /// whether the dropdown is expanded or not
  bool isExpanded = false;

  /// whether the row is hovered or not
  bool isHovered = false;

  @override
  void initState(){
    super.initState();
    getCourseDirectories();
  }

  ///
  ///
  ///
  void getCourseDirectories() async {
    List<Directory> dirs = await FileTreeService.getDirectoriesForCourse(widget.course);

    setState(() {
      widget.course.directories = dirs;
    });
  }

  /// The method to delete the directory
  /// 
  /// Deletes the directory from the list of directories that belong to the course
  deleteDirectory(Directory directory) async {
    bool isDeleted = await FileTreeService.deleteDirectoryForUser(directory);

    if (!isDeleted) {
      print("failed to delete folder for user");
    }
    setState(() {
      widget.course.directories.remove(directory);
    });
  }

  /// Creates a file within the course
  ///
  /// Adds a file to the course at the top level (meaning this file resides in no folder)
  void createSubfile(String fileName) async{
    File file = await FileTreeService.createFile(fileName);
    bool addedToCourse = await FileTreeService.addFiletoCourse(widget.course, file);
    if (!addedToCourse) {
      print("failed to add file to course");
    }
    setState(() {
      widget.course.files.add(file);
      isExpanded = true;
    });
    final OpenDocumentState? openDocumentState = widget.docKey.currentState;
    if (openDocumentState != null) {
      openDocumentState.updateDocument(widget.course.files.last);
    }
  }

  /// Deletes subfile from course
  ///
  /// Removes subfile [file] from the list of files part of the course
  void deleteSubFile(File file) async {
    bool isDeleted = await FileTreeService.deleteFileForUser(file, );
    if (!isDeleted) {
      print("failed to delete file for user");
    }
    setState(() {
      widget.course.files.remove(file);
    });
  }

  /// This function will load the courses and files for a given course
  /// 
  /// To enable lazy loading on old courses. When an old course is expanded, it will call this function to retrieve the 
  /// courses and their contents using the [FileService]
  void loadCourse(Course course) {

  }

  /// The function to create a directory within the Course
  ///
  /// This function takes the name sent by the [AddDirectory] widget and creates a new [Directory]
  /// from it that lives within the [Course]
  void createDirectory(String directoryName) async{
    Directory newDir = await FileTreeService.createDirectory(directoryName);
    bool isAdded = await FileTreeService.addDirectoryToCourse(newDir, widget.course);

    if (!isAdded) {
      print("failed to add directory to course");
    }
    setState(() {
      if (newDir.uuid != "-") {
        widget.course.directories.add(newDir);
        isExpanded = true;  
      }
      
    });
    
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
            hoverColor: Theme.of(context).appColors.backgroundRowHover,
            child: Padding(
              padding: isHovered ? const EdgeInsets.only(left: 20, top: 3, bottom: 3, right: 10) : const EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 10),
              child: Row(
          
                children: [
                  
                  Text(
                    widget.course.name,
                    style: TextStyle(color: Theme.of(context).appColors.textDefault),
                    ),
                  const Spacer(),
                  if (isHovered) ...[
                    IconButton(
                      key: const Key("Create Folder"),
                      padding: const EdgeInsets.all(2),
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        showDialog(
                          context: context, 
                          builder: (BuildContext context) {
                            return AddDirectory(key: const Key("Name Folder"), parent: widget.course, createDirectory: createDirectory);
                          }
                        );
                      },
                      tooltip: "Create Folder",
                      icon: Icon(
                        Icons.create_new_folder_outlined,
                        color: Theme.of(context).appColors.textDefault,
                      ),
                    ),
                    IconButton(
                      key: const Key("Create File"),
                      padding: const EdgeInsets.all(2),
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        showDialog(
                          context: context, 
                          builder: (BuildContext context) {
                            return CreateFile(key: const Key("Name File"), parentName: widget.course.name, createFunc: createSubfile);
                          }
                        );
                      },
                      tooltip: "Create file",
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).appColors.textDefault,
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(2),
                      constraints: const BoxConstraints(),
                      onPressed: (){
                        showDialog(
                          context: context, 
                          builder: (BuildContext context) {
                            return RemoveCourse(course: widget.course, deleteFunc: widget.deleteFunc);
                          }
                        );
                      },
                      tooltip: "Remove Course",
                      icon: Icon(
                        Icons.delete_outline,
                        color: Theme.of(context).appColors.textDefault
                      ),
                    ),
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
        if (isExpanded) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: widget.course.directories.length,
                itemBuilder: (BuildContext context, int index) {
                  return DirectoryRow(directory: widget.course.directories[index], deleteFunction: deleteDirectory,docKey: widget.docKey,);
                }
              )
              
            ],
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.course.files.length,
              itemBuilder: (BuildContext context, int index) {
                return FileRow(file: widget.course.files[index], deleteFunc: deleteSubFile, docKey: widget.docKey,);
              }
            )
          ],
        )
        ]
        
      ],
      );
   
  }
}