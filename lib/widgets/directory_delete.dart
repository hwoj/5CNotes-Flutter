import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/directory.dart';
import 'package:flutter/material.dart';

/// This is a [StatefulWidget] dedicated to renaming a [Directory]
///
/// This [DirectoryDelete] widget is called by the [DirectoryRow] or [OpenDocument] to rename the directory
class DirectoryDelete extends StatefulWidget {

  /// The directory that is being renamed
  final Directory directory;

  /// The main constructor for the [DirectoryDelete] widget
  ///
  /// This constructor passes a [Directory] into the widget
  const DirectoryDelete({
    Key? key,
    required this.directory
  }) : super(key: key);

  @override
  State<DirectoryDelete> createState() => DirectoryDeleteState();
}

/// This is the main state of the [DirectoryDelete] [StatefulWidget]
///
/// This state contains all of the widgets within the the [DirectoryDelete] widget and the logic performed on actions
class DirectoryDeleteState extends State<DirectoryDelete> {

  /// The name that the user is renaming the directory to
  String ?name;

  /// This function validates the name the user wants to rename the directory to
  ///
  /// This function checks to see if the [newName] follows the allowed directory naming conventions and 
  /// returns a boolean that provides indication of if this is the case or not 
  bool validateName(String newName) {
    // make sure that the filename is alphanumeric but allowed to include spaces, underscores, hyphens or periods

    // return whether the above check was true or not

    return false;
  }

  /// This is the function reponsible for renaming the directory given the user input
  ///
  /// It will change the name of the directory after validating it with [validateName]. 
  /// [newName] is the name being passed in
  void saveName(String newName) {
    // call validateName on the newName parameter

    // if validated then modify the directory object with the new name.
    // make call to directory service torename directory in backend.
    // close modal and widget

    // if not validated then display error and keep modal open

    // return
  }

  /// The function reponsible for closing the DirectoryDelete
  ///
  /// This function will handle the logic for the DirectoryDelete widget being closed if the user doesn't 
  /// want to proceed with renaming the directory
  void cancelRename() {
    // close modal and widget
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Delete \"${widget.directory.name}\"" ),
      backgroundColor: Theme.of(context).appColors.backgroundRow,
      children: <Widget>[
        
        const Padding(padding: EdgeInsets.only(left: 30)),
        ClipRect(
          
          
          child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(
              minHeight: 100,
              maxWidth: 700
            ),
            color: Theme.of(context).appColors.containerColor,
            child: Text("Are you sure you want to delete \"${widget.directory.name}\"? Deleting this folder will permanently destroy the folder and all of its contents"),
          ),
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

