import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/screens/home_screen.dart';
import 'package:fivec_notes/widgets/menu_dropdown.dart';
import 'package:flutter/material.dart';

/// The [TopBar] widget is a [StatelessWidget] that represents the bar at the top of the screen of the application
///
/// The widget is going to be present in the different application screens. 
/// As it will be reused across the app, instead of redefining a custom [AppBar] in every screen we're creating a reusable widget
/// In order to satisfy the appBar parameter of the [Scaffold] widget this will live under, we must implement it as a 
/// [PreferredSizeWidget]
class TopBar extends StatefulWidget implements PreferredSizeWidget {

  /// Whether the back arrow in the toolbar should show
 

  /// Creates the app widget to build the structure of the topbar. 
  /// 
  /// The widget returned should create the buttons and define their actions.
  @override
  State<TopBar> createState() => _TopBarState();
  /// Gets parameter so the TopBar fits the screen dimensions
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _TopBarState extends State<TopBar> {
  /// Creates the dropdown menu when the tree dots button
  /// is pressed. 
  /// 
  /// There will be an [IconButton] on the top right that when
  /// pressed, will display a modal screen.  This will have two
  /// buttons: one to redirect to the settings page, and another one 
  /// to logout. 
   

  @override
  Widget build(BuildContext context) {
    /// The [AppBar] widget should have 
    /// [IconButton] widgets to define the back button and hamburger menu on the top left,
    /// [FlutterLogo] logo in the center, and a [ShowDialogue] manage access and [Scrollable] user dropdown menu on the 
    /// top right.  Use the function Navigation.of(context).push() Navigation.of(context).pop()
    /// to move back and forth between screens.
    print(ModalRoute.of(context)?.settings.name);
      return AppBar(
        title: TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Text(
            "5CNotes",
            style: TextStyle(
              color: Theme.of(context).appColors.backgroundRow,
              fontWeight: FontWeight.w700,
              fontSize: 20
            )
          ),
        ),
        shadowColor: const Color(0x33222222),
        iconTheme: IconThemeData(color: Theme.of(context).appColors.backgroundRow),
        actions: <Widget>[
          const MenuDropdown(),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Theme.of(context).appColors.backgroundDefault, const Color(0xFF9E9DFD)], 
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ), 
            ), 
        ),
      );
      
    
    }


}
