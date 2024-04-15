import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/directory.dart';
import 'package:flutter/material.dart';

/// This is a [StatefulWidget] dedicated to renaming a [Directory]
///
/// This [DirectoryDelete] widget is called by the [DirectoryRow] or [OpenDocument] to rename the directory
class DirectoryDelete extends StatefulWidget {

  /// The directory that is being renamed
  final Directory directory;

  /// The function from the parent widget to delete the directory
  final Function(Directory) deleteFunction;

  /// The main constructor for the [DirectoryDelete] widget
  ///
  /// This constructor passes a [Directory] into the widget
  const DirectoryDelete({
    Key? key,
    required this.directory,
    required this.deleteFunction
  }) : super(key: key);

  @override
  State<DirectoryDelete> createState() => DirectoryDeleteState();
}

/// This is the main state of the [DirectoryDelete] [StatefulWidget]
///
/// This state contains all of the widgets within the the [DirectoryDelete] widget and the logic performed on actions
class DirectoryDeleteState extends State<DirectoryDelete> {

  /// The function responsible for deleting the directory
  ///
  /// This function will be called upon the user clicking the button to delete the Directory and delete the Directory
  void deleteDirectory() {
    widget.deleteFunction(widget.directory);
    Navigator.pop(context);
  }

  /// The function reponsible for closing the DirectoryDelete
  ///
  /// This function will handle the logic for the DirectoryDelete widget being closed if the user doesn't 
  /// want to proceed with renaming the directory
  void cancelDelete() {
    // close modal and widget
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Delete \"${widget.directory.name}\"" ),
      backgroundColor: Theme.of(context).appColors.backgroundRow,
      children: <Widget>[
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(
              minHeight: 100,
              maxWidth: 700
            ),
            child: Text("Are you sure you want to delete \"${widget.directory.name}\"? Deleting this folder will permanently destroy the folder and all of its contents"),
          )
        ),
        
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      color: const Color(0xFFFF0000),
                    )
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).appColors.backgroundRow,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
                    ),
                    onPressed: () {
                      deleteDirectory();
                    }, 
                    child: const Text("Delete Folder"),
                    
                  ),
                ],
              )
              
            ),
            const SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      color: Theme.of(context).appColors.textHover,
                    )
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).appColors.backgroundRow,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
                    ),
                    onPressed: () {
                      cancelDelete();
                    }, 
                    child: const Text("Cancel"),
                    
                  ),
                ],
              )
              
            ),
            const Padding(padding: EdgeInsets.only(right: 30))
          ],
        )
        
      ],
    );
  }
}

