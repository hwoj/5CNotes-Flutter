import 'package:fivec_notes/models/user.dart';
import 'package:flutter/material.dart';

/// This class provides data to the rest of the application about which [User] is signed in
///
/// This class has a private member which stores the UUID of the current user and exposes it via getter and setter methods
class UserProvider extends ChangeNotifier {
  String? _currentUserId;

  User? _currentuser;

  /// Exposes current userid to widgets
  ///
  /// returns the id
  String? get currentUserId => _currentUserId;

  /// Exposes current user object to widgets
  ///
  /// returns the private user member
  User? get currentUser => _currentuser;

  /// Updates the currentUserID to a new value
  ///
  /// changes the private currentUserId using the provided [userid] variable and notifies the widget listeners using notifyListeners()
  void setCurrentUserId(String? userId) {
    _currentUserId = userId;
    notifyListeners();
  }
}