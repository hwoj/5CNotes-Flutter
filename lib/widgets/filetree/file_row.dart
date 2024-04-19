import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/file.dart';
import 'package:fivec_notes/widgets/file/file_delete.dart';
import 'package:fivec_notes/widgets/file/file_rename.dart';
import 'package:fivec_notes/widgets/open_document.dart';
import 'package:flutter/material.dart';

/// The [FileRow] represents the listing of an individual file in the [FileTree]
///
/// It will exist as a child to a parent [FolderRow] and display the file name as well as action buttons. 
/// These buttons will exist for deleting the file, editing the file name and sharing the file. 
/// As a stateful widget its primary state is the [FileRowState] state.
class FileRow extends StatefulWidget {

  /// The file that the row will be representing
  final File file;

  /// function from parent row to delete the file and its row
  final Function deleteFunc;


  /// This is the constructor for the [FileRow] that accepts the associated [File] as a parameter
  ///
  /// This constructor is implemented as constant because this is an immutable class. Immutable classes have only constant 
  /// (final) parameters
  const FileRow({
    Key? key,
    required this.file,
    required this.deleteFunc
  }) : super(key: key);

  @override
  State<FileRow> createState() => FileRowState();
}

/// The [FileRowState] comprises the main state of the [FileRow] [StatefulWidget].
///
/// The State will contain all the sub widgets of the widget and the functions for the actions.
/// The contents of the widget are in [build] while the main actions are [shareFile], [deleteFile], [renameFile] and [openFile]
class FileRowState extends State<FileRow> {
  /// This boolean variable keeps track of whether the [File] is open in the editor or not
  bool isOpen = false;

  /// whether the [FileRow] is hovered or not
  bool isHovered = false;

  /// This is the function responsible for sharing the [File] using the share button
  ///
  /// The function will call on the [ManageAccess] widget to allow the user to share the [File] with other people
  shareFile() {

  }

  /// This function is responsible for handling the button command to delete the [File]
  ///
  /// This function will first ask again if the [File] should be deleted and then proceed with the user's action
  deleteFile(File file) {
    widget.deleteFunc(file);
  }

  /// This function is responsible for handling the button action to rename the [File]
  ///
  /// This function will call on a [FileRename] widget to handle the renaming of the file
  void renameFile(String newName) {
    setState(() {
      widget.file.name = newName;
    });
  }

  /// This function is responsible for handling opening this [File] in the editor UI
  ///
  /// This file will take the contents of the file and throw them into 
  void openFile() {
    final GlobalKey<OpenDocumentState> openDocumentKey = GlobalKey();

    // Access the State object using the GlobalKey
    final OpenDocumentState? openDocumentState = openDocumentKey.currentState;

    // Call the function on the State object
    if (openDocumentState != null) {
      print("hi");
      openDocumentState.updateDocument(widget.file);
    }
  }

  /// This is the [build] function for the [FileRow] and defines the contents of the widget
  ///
  /// The primary element of the Widget is the [ListTile] which already generally behaves in the desired manner
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: Theme.of(context).appColors.backgroundRow,
          child: InkWell(
            onTap: () {
              openFile();
            },
            onHover: (hovered) {
              setState(() {
                isHovered = hovered;
              });
            },
            hoverColor: Theme.of(context).appColors.backgroundDarkerComponent,
            child: Padding(
              padding: isHovered ? const EdgeInsets.only(left: 30, top: 3 , bottom: 3, right: 10) : const EdgeInsets.only(left: 30, bottom: 5, top: 5, right: 10),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.insert_drive_file_outlined,
                    color: Theme.of(context).appColors.textDefault,
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    widget.file.name,
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
                            return FileRename(file: widget.file, renameFunc: renameFile,);
                          }
                        );
                      },
                      tooltip: "Rename File",
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
                            return FileDelete(file: widget.file, deleteFunc: deleteFile,);
                          }
                        );
                      },
                      tooltip: "Delete File",
                      icon: Icon(
                        Icons.delete_outline,
                        color: Theme.of(context).appColors.textDefault
                      ),
                    ),
                    
                  ]
                ],
              )
            ),
          ),
        )
      ],
    );
  }
}