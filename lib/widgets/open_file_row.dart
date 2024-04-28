import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/file.dart';
import 'package:fivec_notes/widgets/file/file_delete.dart';
import 'package:fivec_notes/widgets/file/file_rename.dart';
import 'package:flutter/material.dart';

class OpenFileRow extends StatefulWidget {
  
  /// The file being displayed in the [OpenFileRow]
  final File file;

  /// Constructor for [OpenFileRow]
  ///
  /// The main constructor for the [OpenFileRow] class
  const OpenFileRow({
    super.key, 
    required this.file
  });

  @override
  State<OpenFileRow> createState() => OpenFileRowState();
}

///
///
///
class OpenFileRowState extends State<OpenFileRow> {

  ///
  ///
  ///
  renameFile(String name){

  }

  ///
  ///
  ///
  deleteFile(File file) {

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.file.name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Theme.of(context).appColors.textDefault
          ),
        ),
        const SizedBox(width: 15,),
        IconButton(
                      padding: const EdgeInsets.all(2),
                      constraints: const BoxConstraints(),
                      onPressed: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return FileRename(file: widget.file, renameFunc: renameFile,);
                          }
                        );
                      },
                      tooltip: "Rename File",
                      icon: Icon(
                        Icons.create,
                        color: Theme.of(context).appColors.textDefault,
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(2),
                      constraints: const BoxConstraints(),
                      onPressed: (){
                        showDialog(
                          context: context, 
                          builder: (BuildContext context) {
                            return FileDelete(file: widget.file, deleteFunc: deleteFile,);
                          }
                        );
                      },
                      tooltip: "Delete File",
                      icon: Icon(
                        Icons.delete_outline,
                        color: Theme.of(context).appColors.textDefault
                      ),
                    ),
      ],
    );
  }
}