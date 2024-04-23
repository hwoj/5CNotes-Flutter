import 'package:flutter/material.dart';

/// List of access options for a given file (Read or write)
const List<String> accessOptions = <String>["Read", "Write"];

/// Dropdown menu will display the different access option that could be given to another user.
/// As of now, only read and write access can be given. 
class ManageAccessDropdown extends StatefulWidget {
  const ManageAccessDropdown({super.key});

  @override
  State<ManageAccessDropdown> createState() => _ManageAccessDropdownState();
}

class _ManageAccessDropdownState extends State<ManageAccessDropdown> {
  
  /// List of access options
  String dropdownValue = accessOptions.first;

  /// Dropdown menu used to give read/write access to a desired User
  ///
  /// The widge will create a [DropDownMenu<String>], which will allow a user what 
  /// type of access they want to give another user (read or write).
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: accessOptions.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: accessOptions.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
