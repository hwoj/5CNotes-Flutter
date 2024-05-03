import 'package:fivec_notes/main.dart';
import 'package:flutter/material.dart';

class AddCourse extends StatefulWidget {

  final String parentName;

  final Function addFunc;

  const AddCourse({
    super.key, 
    required this.parentName,
    required this.addFunc
  });
  
  @override
  State<AddCourse> createState() => AddCourseState();
}

class AddCourseState extends State<AddCourse> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Theme.of(context).appColors.backgroundRow,
      title: Text(
        "Create new file",
        style: TextStyle(
          color: Theme.of(context).appColors.textDefault
        ),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 20, bottom: 30, right: 30),
          child: Column(
            children: [],
          ),
        )
      ],
    );
  }
}