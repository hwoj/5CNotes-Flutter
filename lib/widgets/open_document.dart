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
    Key? key,
    required this.file
  }) : super(key: key);

  @override
  State<OpenDocument> createState() => OpenDocumentState();
}

/// The primary state of the [OpenDocument] widget
///
/// This state contains all of the contents of the widget and will reload upon any changes to its properties
class OpenDocumentState extends State<OpenDocument> {
  
  /// The file open in the editor
  File ?file;

  final QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    file = widget.file;
  }

  /// The build method that handles the state being made and remade
  ///
  /// The build method contains all of the child widgets that belong inside the [OpenDocument] widget
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Column(
      //   children: [
      //     const QuillToolbar(
      //       configurations: QuillToolbarConfigurations(buttonOptions: QuillSimpleToolbarButtonOptions()),
      //       child: Text("")
      //     ),
      //     QuillEditor(
      //       configurations: QuillEditorConfigurations(
      //         controller: _controller
      //       ),
      //       focusNode: FocusNode(),
      //       scrollController: ScrollController(),
             
      //     ),
      //   ],
      // ),
    );
  }
}