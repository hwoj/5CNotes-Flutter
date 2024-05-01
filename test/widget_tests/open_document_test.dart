import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/screens/home_screen.dart';
import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:fivec_notes/widgets/filetree/file_tree.dart';
import 'package:fivec_notes/widgets/open_document.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/screens/home_screen.dart';
import 'package:fivec_notes/themes/app_colors_theme.dart';
import 'package:fivec_notes/widgets/filetree/file_tree.dart';
import 'package:fivec_notes/widgets/open_document.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {

  // test quill text editor

  // test tree file 

  // test list popup 

  // test creating file 

  // test renaming file 

  // test deleting file

  // test import schedule
  testWidgets("Open Document Widget Test", (tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer(
        builder: (BuildContext context, ThemeNotifier themeNotifier, _) {
          return MaterialApp(

            home: HomeScreen(),
            themeMode: themeNotifier.themeMode,
            theme: Theme.of(context).copyWith(
              extensions: [
                AppColorsTheme.light()
              ]
            ),
            darkTheme: Theme.of(context).copyWith(
              extensions: [
                AppColorsTheme.dark()
              ]
            ),
          );
        }
        )
    ));

    // test adding and removing text, test bold, italics, changing title of file
  }
  );

  

}