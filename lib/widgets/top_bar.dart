import 'package:fivec_notes/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fivec_notes/screens/settings_screen.dart';
import 'package:fivec_notes/main.dart';

/// The [TopBar] widget is a [StatelessWidget] that represents the bar at the top of the screen of the application
///
/// The widget is going to be present in the different application screens. 
/// As it will be reused across the app, instead of redefining a custom [AppBar] in every screen we're creating a reusable widget
/// In order to satisfy the appBar parameter of the [Scaffold] widget this will live under, we must implement it as a 
/// [PreferredSizeWidget]
class TopBar extends StatefulWidget implements PreferredSizeWidget {

  /// Creates the app widget to build the structure of the topbar. 
  /// 
  /// The widget returned should create the buttons and define their actions.
  final TopBar topbar;
  const TopBar({
    Key? key,
    required this.topbar,
  }) : super(key: key);

  State<TopBar> createState() => TopBarState();


  /// Gets parameter so the TopBar fits the screen dimensions
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class TopBarState extends State<TopBar> {
  bool isExpanded = false;
  bool isHovered = false;

  List<TextButton> buttons = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          child: InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            onHover: (hovered) {
              setState(() {
                isHovered = hovered;
              });
            },
            hoverColor: Theme.of(context).appColors.backgroundDarkerComponent,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 5, bottom: 5, right: 10),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () => Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => SettingsScreen()
                      )
                    ), 
                  child: Text("Settings")
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()
                      )
                    ),
                    child: Text("Logout")
                  ),
                  const SizedBox(width: 10,),
                  const Spacer(),
                  if (isHovered) ...[
                    Icon(
                      Icons.create_new_folder_outlined,
                      color: Theme.of(context).appColors.textDefault,
                    ),
                    Icon(
                      Icons.add,
                      color: Theme.of(context).appColors.textDefault,
                    ),
                  ],
                    
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more
                  ),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}