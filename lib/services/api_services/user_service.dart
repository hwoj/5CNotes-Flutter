import 'dart:convert';

import 'package:fivec_notes/models/course.dart';
import 'package:fivec_notes/models/user.dart';
import 'package:http/http.dart' as http;

/// This is the class responsible for the interfaces with other components pertaining to the [User] objects
///
/// This service class will be interacting with the REST API to retrieve information about the users
class UserService {

  /// Retrieves the information for a [User] from the provided [uuid]
  ///
  /// A GET request will be sent to the Spring server to retrieve the information about the user, returning it as a [User]
  /// The [User] object is generated using the [User.fromJson] constructor
  static Future<User> getUserByID(String userId) async {
    http.Response response = await http.get(Uri.parse("http://localhost:8080/users/$userId"));

    if (response.statusCode == 200) {
      Map<String, dynamic> userJson = jsonDecode(response.body);
      return User.fromJson(userJson);
    } else {
      return User(uuid: "-", email: "-", firstName: "-", lastName: "-");
    }
  }

  ///
  ///
  ///
  static Future<User> createUser(String firstName, String lastName, String email) async {
    Uri uri = Uri.parse("http://localhost:8080/users");

    Map<String, String> requestHeaders = {
      "Content-Type": "application/json"
    };

    Map<String, dynamic> requestBody = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email
    };

    http.Response response = await http.post(uri, headers: requestHeaders, body: jsonEncode(requestBody));

    if (response.statusCode == 200) {
      Map<String, dynamic> userJson = jsonDecode(response.body);
      return User.fromJson(userJson);
    } else {
      return User(uuid: "-", email: "-", firstName: "-", lastName: "-");
    }
  }



}