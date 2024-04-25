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
  static const _darktext = Color(0xFF222326);

  ///
  static const _lighterText = Color(0xFF64656c);

  ///
  static const _darkerOffWhite = Color(0xFFE5E6EA);

  static const _evenDarkerOffWhite = Color(0xFFD2D1D7);



  /***** actual color variables used throughout the app *****/

  /// Background color of application
  final Color backgroundDefault;

  /// Background color of input elements
  final Color backgroundInput;

  /// The background color of the object rows in the file tree
  final Color backgroundRow;

  ///
  final Color backgroundDarkerComponent;

  /// default application text color
  final Color textDefault;

  /// hovered text/icon color
  final Color textHover;

  /// Container background color
  final Color containerColor;

  /// Internal constructor used in factories
  ///
  /// This is a private constructor only available to be called by the light theme and dart theme constructors
  const AppColorsTheme._internal({
    required this.backgroundDefault,
    required this.backgroundInput,
    required this.backgroundRow,
    required this.backgroundDarkerComponent,
    required this.textDefault,
    required this.textHover,
    required this.containerColor
  });

  /// Lightmode factory
  ///
  /// The constructor for initializing the application in light mode
  factory AppColorsTheme.light() {
    return const AppColorsTheme._internal(
      backgroundDefault: _blue,
      backgroundInput: _blue,
      backgroundRow: _offwhite,
      backgroundDarkerComponent: _darkerOffWhite,
      textDefault: _darktext,
      textHover: _lighterText,
      containerColor: _evenDarkerOffWhite
    );
  }

  /// Darkmode factory
  ///
  /// The constructor for initializing the application in dark mode
  factory AppColorsTheme.dark() {
    return const AppColorsTheme._internal(
      backgroundDefault: _blue,
      backgroundInput: _blue,
      backgroundRow: _blue,
      backgroundDarkerComponent: _blue,
      textDefault: _blue,
      textHover: _lighterText,
      containerColor: _evenDarkerOffWhite
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