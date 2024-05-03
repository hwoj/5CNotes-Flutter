  import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/models/course.dart';
import 'package:fivec_notes/screens/home_screen.dart';
import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:fivec_notes/widgets/directory/add_directory.dart';
import 'package:fivec_notes/widgets/filetree/course_row.dart';
import 'package:fivec_notes/widgets/filetree/file_tree.dart';
import 'package:fivec_notes/widgets/open_document.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// 
void main() {

    // Test folder creation
    testWidgets("Courserow Widget Test", (tester) async {
      final GlobalKey<OpenDocumentState> openDocumentKey = GlobalKey();
      await tester.pumpWidget(CourseRow(
        docKey: openDocumentKey, 
        course: Course(
          uuid: '123', 
          name: 'Bob', 
          code: "cs123", 
          semester: "fall 2022",
        meetingTimes: [],
        )
      )
    );

    // test adding a course, folder, and file
    final semesterTitleFinder = find.text("fall 2022");

    expect(semesterTitleFinder, findsOneWidget);

    final courseTitleFinder = find.text("cs123");

    expect(courseTitleFinder, findsOneWidget);

    tester.tap(find.byKey(const Key("Create Folder")));

    await tester.enterText(find.byKey(const Key("Name Folder")), "course folder");

    await tester.tap(find.byType(Icon));

    final folderTitleFinder = find.byType(AddDirectory);

    expect(folderTitleFinder, findsOneWidget);

    // test deleting a file, folder, and course
  }
  );

}
    