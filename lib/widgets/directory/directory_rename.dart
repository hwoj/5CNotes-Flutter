import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/directory.dart';
import 'package:flutter/material.dart';

/// This is a [StatefulWidget] dedicated to renaming a [Directory]
///
/// This [DirectoryRename] widget is called by the [DirectoryRow] or [OpenDocument] to rename the directory
class DirectoryRename extends StatefulWidget {

  /// The directory that is being renamed
  final Directory directory;

  /// The function passed in to handle the renaming
  final Function(String) onRename;

  /// The main constructor for the [DirectoryRename] widget
  ///
  /// This constructor passes a [Directory] into the widget
  const DirectoryRename({
    Key? key,
    required this.directory,
    required this.onRename
  }) : super(key: key);

  @override
  State<DirectoryRename> createState() => DirectoryRenameState();
}

/// This is the main state of the [DirectoryRename] [StatefulWidget]
///
/// This state contains all of the widgets within the the [DirectoryRename] widget and the logic performed on actions
class DirectoryRenameState extends State<DirectoryRename> {

  /// The Controller that controls the textfield
  TextEditingController _renameController = TextEditingController();

  bool _invalidName = false;

  @override
  void initState() {
    super.initState();
    _renameController = TextEditingController(text: widget.directory.name);
  }

  @override
  void dispose() {
    _renameController.dispose();
    super.dispose();
  }

  /// The name that the user is renaming the directory to
  String ?name;

  /// This function validates the name the user wants to rename the directory to
  ///
  /// This function checks to see if the [newName] follows the allowed directory naming conventions and 
  /// returns a boolean that provides indication of if this is the case or not 
  bool validateName(String newName) {

    // make sure that the filename is alphanumeric but allowed to include spaces, underscores, hyphens or periods
    RegExp regex = RegExp(r'^[^\\/:*?"<>|]+$', caseSensitive: false);

    // Check if the folder name matches the regular expression and does not start or end with a space
    return regex.hasMatch(newName) && !newName.startsWith(' ') && !newName.endsWith(' ');

  
  }

  /// This is the function reponsible for renaming the directory given the user input
  ///
  /// It will change the name of the directory after validating it with [validateName]. 
  /// [newName] is the name being passed in
  void saveName(String newName) {
    // call validateName on the newName parameter
    setState(() {
      _invalidName = !validateName(newName);
    });
    if (!_invalidName) {
      widget.onRename(newName);
      Navigator.pop(context);
    } else {
      return;
    }
    // if validated then modify the directory object with the new name.
    // make call to directory service torename directory in backend.
    // close modal and widget

    // if not validated then display error and keep modal open

    // return
  }

  /// The function reponsible for closing the DirectoryRename
  ///
  /// This function will handle the logic for the DirectoryRename widget being closed if the user doesn't 
  /// want to proceed with renaming the directory
  void cancelRename() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        "Rename \"${widget.directory.name}\"",
        style: TextStyle(
          color: Theme.of(context).appColors.textDefault
        ),  
      ),
      backgroundColor: Theme.of(context).appColors.backgroundRow,
      children: <Widget>[
        
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 30),
          child: Column(
            children: <Widget>[
              if (_invalidName) ...[
                const Text(
                  "Please enter a valid folder name",
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.red
                  ),
                ),
                const SizedBox(height: 15,)
              ],
              TextField(
                controller: _renameController,
                style: TextStyle(
                  color: Theme.of(context).appColors.textDefault
                ),
                decoration: InputDecoration(
                  labelText: "Folder Name:",
                  border: const OutlineInputBorder(),
                  hintText: widget.directory.name
                ),
              )
            ],
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
                      color: Theme.of(context).appColors.primaryButton,
                    )
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).appColors.primaryButton,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
                    ),
                    onPressed: () {
                     saveName(_renameController.text);
                    }, 
                    child: Text(
                      "Rename Folder",
                      style: TextStyle(
                        color: Theme.of(context).appColors.primaryButtonText
                      ),
                    ),
                    
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
                      cancelRename();
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

