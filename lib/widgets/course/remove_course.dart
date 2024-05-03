import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/course.dart';
import 'package:flutter/material.dart';

class RemoveCourse extends StatefulWidget {

  final Course course;
  final Function(Course) deleteFunc;
  const RemoveCourse({
    super.key, 
    required this.course,
    required this.deleteFunc
  });

  @override
  State<RemoveCourse> createState() => RemoveCourseState();
}

class RemoveCourseState extends State<RemoveCourse> {

  void deleteCourse() {
    widget.deleteFunc(widget.course);
    Navigator.pop(context);
  }

  void cancelDelete() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        "Remove Course",
        style: TextStyle(
          color: Theme.of(context).appColors.textDefault
        ),
      ),
      backgroundColor: Theme.of(context).appColors.backgroundRow,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(
              minHeight: 100,
              maxWidth: 700
            ),
            child: Text(
              "Are you sure you want to remove \"${widget.course.name}\"? Deleting this course will permanently destroy all of your work in it",
              style: TextStyle(
                color: Theme.of(context).appColors.textDefault
              ),
            ),
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
                      color: Theme.of(context).appColors.warningButton,
                    )
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).appColors.backgroundRow,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
                    ),
                    onPressed: () {
                      deleteCourse();
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
      ],
    );
  }
}