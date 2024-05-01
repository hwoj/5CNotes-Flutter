import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/file.dart';
import 'package:fivec_notes/widgets/open_file_row.dart';
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
    setState(() {
      saveFile();
      _file = file;
    });
    
  }

  /// Saves the contents of the [File] that is open in the [OpenDocument]
  ///
  /// Called upon carriage return being hit and when a new [File] is opened
  void saveFile() {
    
  }
  

  @override
  void initState() {
    super.initState();
    _file = widget.file;
    // _controller.formatSelection(ColorAttribute('#${Theme.of(context).appColors.defaultDocumentText}'));

  }



  /// The build method that handles the state being made and remade
  ///
  /// The build method contains all of the child widgets that belong inside the [OpenDocument] widget
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: [
            const SizedBox(width: 15),
            OpenFileRow(file: _file),
            const SizedBox(width: 20,)
          ],
        ),
        QuillToolbar(
          configurations: const QuillToolbarConfigurations(),
          child: Row(
            children: [
              Expanded(
                child: Wrap(
                  children: <Widget>[
                    QuillToolbarHistoryButton(
                      isUndo: true,
                      controller: _controller,
                      options: QuillToolbarHistoryButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    QuillToolbarHistoryButton(
                      isUndo: false,
                      controller: _controller,
                      options: QuillToolbarHistoryButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    QuillToolbarFontSizeButton(
                      controller: _controller,
                      options: QuillToolbarFontSizeButtonOptions(
                        style: TextStyle(
                          color: Theme.of(context).appColors.textDefault
                        ),
                      ),
                    ),
                    QuillToolbarToggleStyleButton(
                      options: QuillToolbarToggleStyleButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                      controller: _controller,
                      attribute: Attribute.bold,
                    ),
                    QuillToolbarToggleStyleButton(
                      options: QuillToolbarToggleStyleButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                      controller: _controller,
                      attribute: Attribute.italic,
                    ),
                    QuillToolbarToggleStyleButton(
                      options: QuillToolbarToggleStyleButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                      controller: _controller,
                      attribute: Attribute.underline,
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: _controller, 
                      attribute: Attribute.strikeThrough,
                      options: QuillToolbarToggleStyleButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: _controller, 
                      attribute: Attribute.inlineCode,
                      options: QuillToolbarToggleStyleButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: _controller, 
                      attribute: Attribute.superscript,
                      options: QuillToolbarToggleStyleButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: _controller, 
                      attribute: Attribute.subscript,
                      options: QuillToolbarToggleStyleButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    QuillToolbarClearFormatButton(
                      controller: _controller,
                      options: QuillToolbarBaseButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    const VerticalDivider(),
                    QuillToolbarColorButton(
                      controller: _controller,
                      isBackground: false,
                      options: QuillToolbarColorButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    QuillToolbarColorButton(
                      controller: _controller,
                      isBackground: true,
                      options: QuillToolbarColorButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    const VerticalDivider(),
                    QuillToolbarToggleCheckListButton(
                      controller: _controller,
                      options: QuillToolbarToggleCheckListButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: _controller,
                      attribute: Attribute.ol,
                      options: QuillToolbarToggleStyleButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: _controller,
                      attribute: Attribute.ul,
                      options: QuillToolbarToggleStyleButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: _controller,
                      attribute: Attribute.codeBlock,
                      options: QuillToolbarToggleStyleButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: _controller,
                      attribute: Attribute.blockQuote,
                      options: QuillToolbarToggleStyleButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    QuillToolbarIndentButton(
                      controller: _controller,
                      isIncrease: true,
                      options: QuillToolbarIndentButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    QuillToolbarIndentButton(
                      controller: _controller,
                      isIncrease: false,
                      options: QuillToolbarIndentButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    QuillToolbarLinkStyleButton(
                      controller: _controller,
                      options: QuillToolbarLinkStyleButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    ),
                    QuillToolbarSearchButton(
                      controller: _controller,
                      options: QuillToolbarSearchButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          ),
                          iconButtonUnselectedData: IconButtonData(
                            style: IconButton.styleFrom(
                              foregroundColor: Theme.of(context).appColors.textDefault
                            )
                          )
                        )
                      ),
                    )
                  ]
                ),
              ),
              
            ],
          ),
          
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            color: Theme.of(context).appColors.editorColor,
            child: QuillEditor.basic(
              configurations: QuillEditorConfigurations(
                controller: _controller,
                placeholder: "Start typing...",
              )
            ),
          ),
        )
      ],
    );
  }
}