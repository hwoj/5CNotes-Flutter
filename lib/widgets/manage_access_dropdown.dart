import 'package:flutter/material.dart';

/// Flutter code sample for [DropdownMenu].

const List<String> accessOptions = <String>["Read, Write"];


class ManageAccessDropdown extends StatefulWidget {
  const ManageAccessDropdown({super.key});

  @override
  State<ManageAccessDropdown> createState() => _ManageAccessDropdownState();
}

class _ManageAccessDropdownState extends State<ManageAccessDropdown> {
  String dropdownValue = accessOptions.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: accessOptions.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
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
