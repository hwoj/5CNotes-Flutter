import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/directory.dart';
import 'package:fivec_notes/models/file.dart';
import 'package:fivec_notes/services/api_services/filetree_service.dart';
import 'package:fivec_notes/widgets/directory/add_subdirectory.dart';
import 'package:fivec_notes/widgets/directory/directory_delete.dart';
import 'package:fivec_notes/widgets/directory/directory_rename.dart';
import 'package:fivec_notes/widgets/file/create_file.dart';
import 'package:fivec_notes/widgets/filetree/file_row.dart';
import 'package:fivec_notes/widgets/open_document.dart';
import 'package:flutter/material.dart';

/// The [DirectoryRow] [StatefulWidget] is the widget responsible for an individual [Directory] in the [FileTree]
///
/// The [DirectoryRow] will contain the Directory name as well as a number of actions to rename, delete and expand/collapse. 
/// The [DirectoryRow] will also be a parent to a number of [FileRow] widgets that are dynamically rendered as the child 
/// [File] objects of the given [Directory] object
class DirectoryRow extends StatefulWidget {

  /// The [Directory] object that the [DirectoryRow] represents
  final Directory directory;

  /// The function from the parent widget to delete the directory
  final Function(Directory) deleteFunction;

  /// The [GlobalKey] to alter the [OpenDocumentState]
  final GlobalKey<OpenDocumentState> docKey;


  /// The constructor for the [DirectoryRow] object
  /// 
  /// This is the default and only constructor for the [DirectoryRow] object
  const DirectoryRow({
    super.key,
    required this.directory,
    required this.deleteFunction,
    required this.docKey
  });

  @override
  State<DirectoryRow> createState() => DirectoryRowState();
}

/// This is the primary state of the [DirectoryRow] [StatefulWidget]
///
/// This state will contain all of the contents of the [DirectoryRow] widget along with the logic to handle actions performed on it. 
/// The primary subwidget being used is an [ExpansionTile] who's children are other rows of [FileRow] or [DirectoryRow]. 
/// The [renameDirectory] and [deleteDirectory] functions handle those actions respectively while the flutter [ExpansionTile] widget 
/// has built in capabaility to perform the collapsing and expanding.
class DirectoryRowState extends State<DirectoryRow> {

  /// Whether the row is expanded or not
  bool isExpanded = false;

  /// Whether the row is hovered or not
  bool isHovered = false;

  /// The function responsible for handling the action to rename the [Directory] from the [DirectoryRow]
  ///
  /// This function will be passed to the [DirectoryRename] widget to rename the [Directory]
  renameDirectory(String newName) {
    setState(() {
      widget.directory.name = newName;
    }); 
  }

  /// The function responsible for handling the action to delete the sub [Directory] from the [DirectoryRow]
  ///
  /// This function will confirm whether the the [Directory] and all contents should be deleted and then 
  /// carry out the specified action
  void deleteSubDirectory(Directory directory) async {
    bool isDeleted = await FileTreeService.deleteDirectoryForUser(directory);
    if (!isDeleted) {
      print("failed to delete subdirectory");
    }
    setState(() {
      widget.directory.subdirectories.remove(directory);
    });
  }

  /// The function responsible for creating a subdirectory within the [Directory]
  ///
  /// This function will allow the user to create a new directory that exists underneath the current [DirectoryRow]'s directory
  void createSubDirectory(String name) async {
    Directory newSubDir = await FileTreeService.createDirectory(name);
    bool isAdded = await FileTreeService.addDirectoryToDirectory(widget.directory, newSubDir);
    if (!isAdded) {
      print("failed to add directory to directory");
    }
    setState(() {
      if (newSubDir.uuid != "-") {
        widget.directory.subdirectories.add(newSubDir);
        isExpanded = true;
      }
    });
  }

  /// Removes the specified file
  ///
  /// Deletes the file from the folder and updates the state of the row
  void deleteSubfile(File file) async {
    bool isDeleted = await FileTreeService.deleteFileForUser(file);
    if (!isDeleted) {
      print("failed to delete file for user");
    }
    setState(() {
      widget.directory.files.remove(file);
    });
  }

  /// The function responsible for creating a new [File] within the current [Directory]
  /// 
  /// This function will create a new [File] to be represented as a [FileRow] within the current [Directory] and [DirectoryRow]
  createSubFile(String fileName) async {

    File file = await FileTreeService.createFile(fileName);

    bool isAdded = await FileTreeService.addFileToDirectory(widget.directory, file);

    if (!isAdded) {
      print("failed to add file to directory");
    }
    setState(() {
      if (file.uuid != "-") {
        widget.directory.files.add(file);
        isExpanded = true;
        final OpenDocumentState? openDocumentState = widget.docKey.currentState;
        if (openDocumentState != null) {
          openDocumentState.updateDocument(widget.directory.files.last);
        }
      }
      
    });
  }

  /// The [build] function creates the widget and the subwidgets it contains
  ///
  /// The primary child is the [ExpansionTile] which will contain all of the [DirectoryRow] widget's children
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
              padding: isHovered ? const EdgeInsets.only(left: 30 , top: 3, bottom: 3, right: 10) : const EdgeInsets.only(left: 30, top: 5, bottom: 5, right: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.folder_outlined,
                    color: Theme.of(context).appColors.textDefault,
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    widget.directory.name,
                    style: TextStyle(color: Theme.of(context).appColors.textDefault),
                    ),
                  const Spacer(),
                  if (isHovered) ...[
                    IconButton(
                      padding: const EdgeInsets.all(2),
                      constraints: const BoxConstraints(),
                      onPressed: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return DirectoryRename(directory: widget.directory, onRename: renameDirectory,);
                          }
                        );
                      },
                      tooltip: "Rename Folder",
                      icon: Icon(
                        Icons.create,
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
                            return DirectoryDelete(directory: widget.directory, deleteFunction: widget.deleteFunction,);
                          }
                        );
                      },
                      tooltip: "Delete Folder",
                      icon: Icon(
                        Icons.delete_outline,
                        color: Theme.of(context).appColors.textDefault
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(2),
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        showDialog(context: context, 
                          builder: (BuildContext context) {
                            return AddSubDirectory(parent: widget.directory, subfolderCreate: createSubDirectory,);
                          }
                        );
                      },
                      tooltip: "Create Subfolder",
                      icon: Icon(
                        Icons.create_new_folder_outlined,
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
                            return CreateFile(parentName: widget.directory.name, createFunc: createSubFile);
                          }
                        );
                      },
                      tooltip: "Create file",
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).appColors.textDefault,
                      ),
                    ),
                  ],
                    
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Theme.of(context).appColors.textDefault,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isExpanded)...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.directory.subdirectories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DirectoryRow(directory: widget.directory.subdirectories[index], deleteFunction: deleteSubDirectory, docKey: widget.docKey,);
                  }
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.directory.files.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FileRow(file: widget.directory.files[index], deleteFunc: deleteSubfile, docKey: widget.docKey,);
                  }
                ),
              )
            ],
          )
        ]
      ],
    );
  }
}