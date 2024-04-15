import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/file.dart';
import 'package:flutter/material.dart';

/// The [StatefulWidget] that handles file deletions
///
/// A wrapper around a [SimpleDialog] to handle/confirm the file deletion
class FileDelete extends StatefulWidget {

  /// The file being deleted
  final File file;

  /// The function called upon delete from [FileRow]
  final Function(File) deleteFunc;

  /// Constructor for [FileDelete] 
  ///
  /// Will be called from the [FileRow] to pull up the modal
  const FileDelete({
    Key? key,
    required this.file,
    required this.deleteFunc
  });

  @override
  State<FileDelete> createState() => FileDeleteState();
}

/// Primary state of the widget
///
/// Contains all of the widgets and logic for rebuilding the state
class FileDeleteState extends State<FileDelete> {

  /// The function to handle the action to delete
  ///
  /// Calls the parent row's delete function and closes the modal
  void deleteFile() {
    widget.deleteFunc(widget.file);
    Navigator.pop(context);

  }

  /// Cancels the file deletion
  ///
  /// Closes the modal to cancel the deletion
  void cancelDelete() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog (
      title: Text("Delete ${widget.file.name}"),
      backgroundColor: Theme.of(context).appColors.backgroundRow,
      children: [
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(
              minHeight: 100,
              maxWidth: 700
            ),
            child: Text("Are you sure you want to delete \"${widget.file.name}\"? Deleting this file will permanently destroy its contents"),
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
                      deleteFile();
                    }, 
                    child: const Text("Delete File"),
                    
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
      ]
    );
  }
}