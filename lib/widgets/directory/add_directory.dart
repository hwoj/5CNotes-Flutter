import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/course.dart';
import 'package:flutter/material.dart';

/// The class for the [StatefulWidget] that adds a [Directory] to a [Course]
///
/// 
class AddDirectory extends StatefulWidget {

  /// The parent [Course] of the [Directory]
  final Course parent;

  /// The function from the parent [Course] to create the directory
  final Function(String) createDirectory;

  /// The [AddDirectory] constructor
  ///
  /// Called by the [Course] to open the modal
  const AddDirectory({
    Key? key,
    required this.parent,
    required this.createDirectory
  });

  @override
  State<AddDirectory> createState() => AddDirectoryState();
}

/// Primary state of the [AddDirectory] class
///
/// Responsible for the contents of the widget and their state
class AddDirectoryState extends State<AddDirectory> {

  TextEditingController _controller = TextEditingController();

  bool _invalidName = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }

  /// This function validates the name the user wants to name the directory as
  ///
  /// This function checks to see if the [newName] follows the allowed directory naming conventions and 
  /// returns a boolean that provides indication of if this is the case or not 
  bool validateName(String newName) {

    // make sure that the filename is alphanumeric but allowed to include spaces, underscores, hyphens or periods
    RegExp regex = RegExp(r'^[^\\/:*?"<>|]+$', caseSensitive: false);

    // Check if the folder name matches the regular expression and does not start or end with a space
    return regex.hasMatch(newName) && !newName.startsWith(' ') && !newName.endsWith(' ');

  
  }


  /// Cancels the creation of the new directory
  ///
  /// Returns the navigator to previous state and cancels the directory creation
  void cancelCreation() {
    Navigator.pop(context);
  }

  /// Creates a new folder within the parent [Course]
  ///
  /// validates the new name and then sends it to parent widget using provided function
  void createFolder() {
    setState(() {
      _invalidName = !validateName(_controller.text);
    });
    if (!_invalidName) {
      widget.createDirectory(_controller.text);
      Navigator.pop(context);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Theme.of(context).appColors.backgroundRow,
      title: Text(
        "Create Folder for ${widget.parent.name}",
        style: TextStyle(
          color: Theme.of(context).appColors.textDefault
        ),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 30),
          child: Column(
            children:  <Widget>[
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
                controller: _controller,
                style: TextStyle(
                  color: Theme.of(context).appColors.textDefault
                ),
                decoration: const InputDecoration(
                  labelText: "Folder Name:",
                  border: OutlineInputBorder()
                ),
              )
            ],
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
                      color: Theme.of(context).appColors.primaryButton,
                    )
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).appColors.primaryButton,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
                    ),
                    onPressed: () {
                      createFolder();
                    }, 
                    child: Text(
                      "Create Folder",
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
                      cancelCreation();
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