import 'package:fivec_notes/models/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

/// The [OpenDocument] [StatefulWidget] is responsible for the document that is currently being edited by the user
///
/// This widget will contain the Quill editor and other pertinent document information
class OpenDocument extends StatefulWidget {
  
  /// The file the user is currently editing. 
  /// Must be final because widgets are immutable classes. file will be changed
  /// within the state
  final File file;

  /// The primary constructor for the OpenDocument class
  ///
  /// This constructor will pass the file into the widget
  const OpenDocument({
    super.key,
    required this.file
  });

  @override
  State<OpenDocument> createState() => OpenDocumentState();
}

/// The primary state of the [OpenDocument] widget
///
/// This state contains all of the contents of the widget and will reload upon any changes to its properties
class OpenDocumentState extends State<OpenDocument> {

  late File _file;
  

  QuillController _controller = QuillController.basic();

  /// Updates the document that is open in the editor
  ///
  /// Takes in a new file who's contents to be displayed in the editor. This 
  /// function will be called by the [FileRow] widget when clicked to pass in the file
  void updateDocument(File file) {
    print("test");
    setState(() {
      _file = file;
    });
    print(file.name);
    
  }

  

  @override
  void initState() {
    super.initState();
    _file = widget.file;

  }



  doesstuff() {
    print(_controller.document.toDelta());
  }

  /// The build method that handles the state being made and remade
  ///
  /// The build method contains all of the child widgets that belong inside the [OpenDocument] widget
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(_file.name),
        TextButton(onPressed: doesstuff, child: Text("click me!")),
        QuillToolbar.simple(
          configurations: QuillSimpleToolbarConfigurations(
            controller: _controller
          )
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            color: Colors.white,
            child: QuillEditor.basic(
              configurations: QuillEditorConfigurations(
                controller: _controller,
                placeholder: "hello world"
              )
            ),
          ),
        )
      ],
    );
  }
}