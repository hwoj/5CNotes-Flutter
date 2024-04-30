import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/directory.dart';
import 'package:flutter/material.dart';

/// The [StatefulWidget] responsible for creating a subdirectory
///
/// This widget is a wrapper around a [SimpleDialog] and passes back the directory name to the parent [DirectoryRow]
class AddSubDirectory extends StatefulWidget {

  /// The parent [Directory] of the subdirectory being created
  final Directory parent;

  /// The function in the parent to create the subfolder
  final Function(String) subfolderCreate;

  /// The primary constructor for the [AddSubDirectory] widget
  /// 
  /// This is the only constructor for this class
  AddSubDirectory({
    Key? key,
    required this.parent,
    required this.subfolderCreate
  }) : super(key: key);

  @override
  State<AddSubDirectory> createState() => AddSubDirectoryState();
}

/// The primary state of the [AddSubDirectory] [StatefulWidget]
///
/// This is the state that will create the widget and handle updates and logic to it
class AddSubDirectoryState extends State<AddSubDirectory> {

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

  /// cancels subfolder creation
  ///
  /// called from button to exit out of modal
  void cancelCreation() {
    Navigator.pop(context);
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

  /// Function to create the subfolder
  ///
  /// This function creates a subfolder within the parent
  void createSubfolder() {
    setState(() {
      _invalidName = !validateName(_controller.text);
    });
    if (!_invalidName) {
      widget.subfolderCreate(_controller.text);
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
        "Create subfolder for ${widget.parent.name}",
        style: TextStyle(
          color: Theme.of(context).appColors.textDefault
        ),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 30),
          child: Column(
            children: [
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
                  labelText: "Subfolder Name:",
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
                      createSubfolder();
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