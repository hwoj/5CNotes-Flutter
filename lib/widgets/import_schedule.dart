import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fivec_notes/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImportSchedule extends StatefulWidget {
  @override
  State<ImportSchedule> createState() => ImportScheduleState();
}

/// State class for the [ImportSchedule] widget
///
/// Controls the modal
class ImportScheduleState extends State<ImportSchedule> {

  /// The selected file in the filepicker
  File? selectedFile;

  /// The value of the dropdown to choose upload method
  String dropdownValue = "From link";

  /// Cancel the schedule import process
  ///
  /// Closes the modalfor the rename and returns screen to previous state
  void cancelImport() {
    Navigator.pop(context);
  }

  Future<void> _pickFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    final RegExp validIcsRegex = RegExp(r'\.ics$');

    if (result != null && validIcsRegex.hasMatch(result.files.single.path!)) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  void _importSchedule() {

  }

  @override
  Widget build(BuildContext context) {
  
    return SimpleDialog(
      title: const Text("Import Semester Schedule From Link or File"),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  const Text("Upload method:"),
                  const SizedBox(width: 15,),
                  DropdownMenu<String>(
                    initialSelection: dropdownValue,
                    onSelected: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                      
                    },
                    dropdownMenuEntries: const [
                      DropdownMenuEntry<String>(
                        value: "From link",
                        label: "From link"
                      ),
                      DropdownMenuEntry<String>(
                        value: "From file",
                        label: "From file"
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              if (dropdownValue == "From link") 
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Link to schedule")
                  ),
                )
              ,if (dropdownValue == "From file")
                Row(
                  children: [
                    const Text("selected file:"),
                    SizedBox(width: 15,),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Theme.of(context).appColors.backgroundDefault,
                          width: 2
                        )
                      ),
                    
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Theme.of(context).appColors.textDefault,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10)
                        ),
                        onPressed: () {
                          _pickFile();
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.file_upload_outlined),
                            SizedBox(width: 5,),
                            Text("Upload File"),
                          ],
                        ),
                      )
                    ),
                    selectedFile != null ? Row( children: <Widget>[const SizedBox(width: 10,), Text(selectedFile!.path)]) : Container()
                  ],
                )
              ,
              const SizedBox(height: 20,),
              Row(
                
                children: <Widget>[
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            color: Theme.of(context).appColors.backgroundDefault,
                          )
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Theme.of(context).appColors.backgroundRow,
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10)
                          ),
                          onPressed: () {
                            _importSchedule();
                          },
                          child: const Text("Import Schedule"),
                        )
                      ]
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
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10)
                          ),
                          onPressed: () {
                            cancelImport();
                          }, 
                          child: const Text("Cancel"),
                        
                        ),
                      ],
                    )
                  
                  ),
                ],
              ),
              
            ],
          ),
        )
      ],
    );
  }
}