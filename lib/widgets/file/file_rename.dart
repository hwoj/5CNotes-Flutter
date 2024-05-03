import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/file.dart';
import 'package:flutter/material.dart';

/// This is a [StatefulWidget] dedicated to renaming a [File]
///
/// This [FileRename] widget is called by the [FileRow] or [OpenDocument] to rename the file
class FileRename extends StatefulWidget {

  /// The file that is being renamed
  final File file;

  /// The function in the [FileRow] to rename the [File]
  final Function(String) renameFunc;

  /// The main constructor for the [FileRename] widget
  ///
  /// This constructor passes a [File] into the widget
  const FileRename({
    Key? key,
    required this.file,
    required this.renameFunc
  }) : super(key: key);

  @override
  State<FileRename> createState() => FileRenameState();
}

/// This is the main state of the [FileRename] [StatefulWidget]
///
/// This state contains all of the widgets within the the [FileRename] widget and the logic performed on actions
class FileRenameState extends State<FileRename> {

  TextEditingController _renameController = TextEditingController();

  bool _invalidName = false;

  @override
  void initState() {
    super.initState();
    _renameController = TextEditingController(text: widget.file.name);
  }

  @override
  void dispose() {
    _renameController.dispose();
    super.dispose();
  }

  /// Ensures the file name is valid
  ///
  /// Uses regex to validate the name of the file being created
  bool validateName(String name) {
    // Create regex to validate file name
     RegExp regex = RegExp(
      r'^[a-zA-Z0-9_\-\.]+$',
      caseSensitive: false,
    );

    // Check if the file name matches the regular expression
    return regex.hasMatch(name);
  }

  /// This is the function reponsible for renaming the file given the user input
  ///
  /// It will change the name of the file after validating it with [validateName]
  void saveName(String newName) {
    setState(() {
      _invalidName = !validateName(newName);
    });
    if (!_invalidName) {
      widget.renameFunc(newName);
      Navigator.pop(context);
    } else {
      return;
    }
  }

  /// The function reponsible for closing the FileRename
  ///
  /// This function will handle the logic for the FileRename widget being closed if the user doesn't 
  /// want to proceed with renaming the file
  void cancelRename() {
    
    Navigator.pop(context);
  }

  /// The build function contains the contents of the state
  ///
  /// this function will handle the creation and recreation of the state
  @override
  Widget build(BuildContext context) {
    // will contain a dialog with a text input area and 2 buttons
    // 1 button for closing the widget, another for submitting the rename
    return SimpleDialog(
      title: Text(
        "Rename ${widget.file.name}",
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
                  "Please enter a valid file name. Must include no spaces",
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
                  labelText: "File Name:",
                  border: const OutlineInputBorder(),
                  hintText: widget.file.name
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
                      "Rename File",
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

