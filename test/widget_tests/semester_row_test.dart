  import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/course.dart';
import 'package:fivec_notes/models/semester.dart';
import 'package:fivec_notes/screens/home_screen.dart';
import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:fivec_notes/widgets/course/remove_course.dart';
import 'package:fivec_notes/widgets/directory/add_directory.dart';
import 'package:fivec_notes/widgets/filetree/course_row.dart';
import 'package:fivec_notes/widgets/filetree/file_tree.dart';
import 'package:fivec_notes/widgets/filetree/semester_row.dart';
import 'package:fivec_notes/widgets/open_document.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// 
void main() {

    // Test folder creation
    testWidgets("Semester Row Widget Test", (tester) async {
      final GlobalKey<OpenDocumentState> openDocumentKey = GlobalKey();
      await tester.pumpWidget(SemesterRow(
        docKey: openDocumentKey,
        semester: Semester(
          name: "Fall 2023",
          isCurrent: true,
        ),
        )
      );

    // test adding a course, folder, and file
    final semesterTitleFinder = find.text("Fall 2023");

    expect(semesterTitleFinder, findsOneWidget);

    // final courseTitleFinder = find.text("cs81");

    // expect(courseTitleFinder, findsOneWidget);

    tester.tap(find.byKey(const Key("Create Folder")));

    await tester.enterText(find.byKey(const Key("Name Folder")), "course folder");

    await tester.tap(find.byType(Icon));

    final folderTitleFinder = find.byType(AddDirectory);

    expect(folderTitleFinder, findsOneWidget);

    // test deleting a file, folder, and course
  }
  );

}
    