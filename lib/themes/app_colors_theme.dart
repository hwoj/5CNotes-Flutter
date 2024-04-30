import 'package:flutter/material.dart';

/// [AppColorsTheme] defines the color themes for the application
///
/// This class defines light and dark themes for the application as well as methods to initialize the 
/// application in one mode or the other
class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  /**** reference colors ******/

  /// main blue color
  static const _blue = Color(0xFF4556ED);

  /// offwhite color for UI element background
  static const _offwhite = Color(0xFFFBFAFC);

  /// regular text color for widgets
  static const _darkText = Color(0xFF222326);

  ///
  static const _lighterText = Color(0xFF64656c);

  ///
  static const _darkerOffWhite = Color(0xFFE5E6EA);

  ///
  static const _evenDarkerOffWhite = Color(0xFFD2D1D7);

  ///
  static const _offBlack = Color(0xFF222326); 

  static const _lighterOffBlack = Color(0xFF434449);

  ///
  static const _darkBlue = Color(0xFF081E58);

  static const _lightText = Color(0xFFFBFAFC);

  static const _lightBlue = Color(0xFF9E9DFD);

  // static const _darkestBlue = Color(0xFF030F26);

  static const _darkestGrey = Color(0xFF1A1B1D);

  static const _lightestBlue = Color(0xFFCCC8FF);

  static const _lightRed = Color(0xFFff7777);

  /***** actual color variables used throughout the app *****/

  /// Background color of application
  final Color backgroundDefault;

  /// Background color of input elements
  final Color backgroundInput;

  /// The background color of the object rows in the file tree
  final Color backgroundRow;

  ///
  final Color backgroundRowHover;

  /// default application text color
  final Color textDefault;

  /// hovered text/icon color
  final Color textHover;

  /// Container background color
  final Color containerColor;

  ///
  final Color appBarText;

  ///
  final Color appBarStart;
  
  ///
  final Color appBarEnd;

  ///
  final Color editorColor;

  ///
  final Color primaryButton;

  ///
  final Color primaryButtonText;

  ///
  final Color warningButton;

  ///
  final Color defaultDocumentText;

  /// Internal constructor used in factories
  ///
  /// This is a private constructor only available to be called by the light theme and dart theme constructors
  const AppColorsTheme._internal({
    required this.backgroundDefault,
    required this.backgroundInput,
    required this.backgroundRow,
    required this.backgroundRowHover,
    required this.textDefault,
    required this.textHover,
    required this.containerColor,
    required this.appBarText,
    required this.appBarStart,
    required this.appBarEnd,
    required this.editorColor,
    required this.primaryButton,
    required this.primaryButtonText,
    required this.warningButton,
    required this.defaultDocumentText
  });

  /// Lightmode factory
  ///
  /// The constructor for initializing the application in light mode
  factory AppColorsTheme.light() {
    return const AppColorsTheme._internal(
      backgroundDefault: _blue,
      backgroundInput: _blue,
      backgroundRow: _offwhite,
      backgroundRowHover: _darkerOffWhite,
      textDefault: _darkText,
      textHover: _lighterText,
      containerColor: _evenDarkerOffWhite,
      appBarText: _lightText,
      appBarStart: _blue,
      appBarEnd: _lightBlue,
      editorColor: Colors.white,
      primaryButton: _blue,
      primaryButtonText: _lightText,
      warningButton: Colors.red,
      defaultDocumentText: Colors.white
    );
  }

  /// Darkmode factory
  ///
  /// The constructor for initializing the application in dark mode
  factory AppColorsTheme.dark() {
    return const AppColorsTheme._internal(
      backgroundDefault: _blue,
      backgroundInput: _blue,
      backgroundRow: _offBlack,
      backgroundRowHover: _lighterOffBlack,
      textDefault: _lightText,
      textHover: _lightText,
      containerColor: _evenDarkerOffWhite,
      appBarText: _lightText,
      appBarStart: _darkBlue,
      appBarEnd: _darkBlue,
      editorColor: _darkestGrey,
      primaryButton: _lightBlue,
      primaryButtonText: _darkText,
      warningButton: _lightRed,
      defaultDocumentText: Colors.white
    );
  }

  @override
  ThemeExtension<AppColorsTheme> copyWith({bool? lightmode}) {
    if (lightmode == null || lightmode == true) {
      return AppColorsTheme.light();
    }
    return AppColorsTheme.dark();
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
    covariant ThemeExtension<AppColorsTheme>? other,
    double t
  ) => this;


}