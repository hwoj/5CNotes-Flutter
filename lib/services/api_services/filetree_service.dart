import 'dart:convert';

import 'package:fivec_notes/models/course.dart';
import 'package:fivec_notes/models/directory.dart';
import 'package:fivec_notes/models/file.dart';
import 'package:fivec_notes/models/semester.dart';
import 'package:fivec_notes/models/user.dart';
import 'package:fivec_notes/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This class encapsulates all the interfaces for [File] objects in the local file system as well as the OT and REST API
///
/// The service class will handle background synchronization, offline file updates, online file updates and refreshing the local file system upon opening the app
class FileTreeService {

  /// This is a constant holding the value for the period for background syncs. 
  /// The [Duration] data type is here to allow for calculations with date times 
  static const Duration refreshPeriod = Duration(hours: 1);

  /// This DateTime value holds the time for the last file sync according to the server time. 
  /// This value will be updated each time the entire local filesystem is updated. 
  /// It uses server time to ensure consistency across components
  static DateTime? lastSync;

  /// This function calls to update the local file tree in the background
  /// 
  /// Every [refreshPeriod] the backgroundSync function will be called to update the files in the local filesystem.
  /// Upon updating it will update the lastSync class variable with the server time from the last update of the files.
  /// The server time is expected to be sent along with the data that the backgroundSync requests.
  /// The function is called under the assumption that it is supposed to be time to call the backgroundSync. 
  /// The functionality to determine when this should be performed is handled separately.
  backgroundSync() {
    // A GET request will be sent to the backend server requesting the last update times for each of the files the logged in user has access to

    // For each of the files and update times returned, check to see if the local file needs to be updates
    // If a file needs updates, request the updated contents of the file. 
    // Update the local meta data with the update time of the file from the Postgres database

    // Update the lastSync time with the server time from the synchronization

  }

  ///
  ///
  ///
  static Future<bool> isOnline() async {
    var connection = await Connectivity().checkConnectivity();
    if (connection.contains(ConnectivityResult.none)) {
      return false;
    } else {
      return true;
    }

  }

  ///
  ///
  ///
  static Future<bool> shouldSaveLocally() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? shouldSave = prefs.getBool("saveLocally");

    if (shouldSave != null || shouldSave == true) {
      return true;
    } else {
      return false;
    }
  }

  /// This function retrieves the directories and files that the [User] has access to
  ///
  /// This function is called to help initialize the [FileTree] widget
  static Future<List<Course>> retrieveSemesterFileTree(Semester semester) async {
    UserProvider userProvider = UserProvider();
    String? userId = userProvider.currentUserId;

    if (userId != null) {
      var response = await http.get(Uri.parse("http://localhost:8080/users/$userId"));
      
      if (response.statusCode == 200) {
        // print("Response body: ${response.body}");
        Map<String, dynamic> userResponse = jsonDecode(response.body);
        List<dynamic> userdynamic = userResponse['courses'];  
        List<Map<String, dynamic>> userCourses = userdynamic.cast<Map<String, dynamic>>();
        List<Course> courses = userCourses.map((json) => Course.fromJson(json)).toList();

        return courses;
      }
    }

    return [];
  }

  /// Gets the contents of a file using the file metadata
  ///
  /// Requests the contents of the file from the backend using the id from the [file] argument
  getFile(File file) {
    // send get request to server to get contents of the file using the id of the file passed into the function

    // overwrite the contents of the local file or create new file on disk if doesn't exist on disk yet
  }

  static Future<Directory> createDirectory(String directoryName) async {
    UserProvider userProvider = UserProvider();
    String? userId = userProvider.currentUserId;

    Uri uri = Uri.parse("http://localhost:8080/directories");

    var requestBody = {
      "folderName": directoryName
    };

    var requestHeaders = {
      "Content-Type": "application/json"
    };

    try {
      http.Response response = await http.post(uri, headers: requestHeaders, body: jsonEncode(requestBody));

      if (response.statusCode == 200) {
        var directoryResponse = jsonDecode(response.body);
        Directory directory = Directory.fromJson(directoryResponse);
        print("here");
        response = await http.put(Uri.parse("http://localhost:8080/directories/${directory.uuid}/users/$userId"));
        
        if (response.statusCode == 200) {
          return directory;
        }
      }
    } catch (e) {
      print("exception: $e");
    }

    return Directory(uuid: "-", name: "-");
  }

  /// creates a directory for the user
  ///
  /// 
  static Future<bool> addDirectoryToCourse(Directory directory, Course course) async {
    

    http.Response response = await http.put(Uri.parse("http://localhost:8080/directories/${directory.uuid}/courses/${course.uuid}"));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }

  }

  ///
  ///
  ///
  static Future<bool> addDirectoryToDirectory(Directory parentDir, Directory childDir) async {
    http.Response response = await http.put(Uri.parse("http://localhost:8080/directories/${childDir.uuid}/directories/${parentDir.uuid}"));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  /// 
  ///
  ///
  static Future<File> createFile(String fileName) async {
    if (await isOnline()) {
      print("im online!!");
    }
    UserProvider userProvider = UserProvider();
    String? userId = userProvider.currentUserId;

    Uri uri = Uri.parse("http://localhost:8080/files");

    var requestBody = {
      "fileName": fileName
    };

    var requestHeaders = {
      "Content-Type": "application/json"
    };


    if (userId != null) {
      http.Response response = await http.post(uri, headers: requestHeaders, body: jsonEncode(requestBody));

      if (response.statusCode == 200) {
        File file = File.fromJson(jsonDecode(response.body));
        response = await http.put(Uri.parse("http://localhost:8080/files/${file.uuid}/users/$userId"));

        if (response.statusCode == 200) {
          return file;
        }
      }

    }

    return File(name: "-", uuid: "-");
  }

  ///
  ///
  ///
  static Future<bool> addFileToDirectory(Directory directory, File file) async {
    http.Response response = await http.put(Uri.parse("http://localhost:8080/files/${file.uuid}/directories/${directory.uuid}"));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  ///
  ///
  ///
  static Future<bool> addFiletoCourse(Course course, File file) async {
    http.Response response = await http.put(Uri.parse("http://localhost:8080/files/${file.uuid}/courses/${course.uuid}"));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  ///
  ///
  ///
  static Future<bool> deleteFileForUser(File file) async {
    UserProvider userProvider = UserProvider();
    String? userId = userProvider.currentUserId;

    http.Response response = await http.delete(Uri.parse("http://localhost:8080/files/${file.uuid}/users/$userId"));

    if (response.statusCode == 200) {

      return true;
    } else {
      return false;
    }
  }

  ///
  ///
  ///
  static Future<bool> deleteFileForUserInDir(File file, Directory dir) async {
    UserProvider userProvider = UserProvider();
    String? userId = userProvider.currentUserId;

    http.Response response = await http.delete(Uri.parse("http://localhost:8080/files/${file.uuid}/users/$userId"));

    if (response.statusCode == 200) {
      http.Response response = await http.delete(Uri.parse("http://localhost:8080/files/${file.uuid}/directories/${dir.uuid}"));

      return true;
    } else {
      return false;
    }
  }

  ///
  ///
  ///
  static Future<bool> deleteDirectoryForUser(Directory directory) async {
    UserProvider userProvider = UserProvider();
    String? userId = userProvider.currentUserId;

    http.Response response = await http.delete(Uri.parse("http://localhost:8080/directories/${directory.uuid}/users/$userId"));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  ///
  ///
  ///
  static Future<bool> addCourseToUser(Course course) async {
    UserProvider userProvider = UserProvider();
    String? userId = userProvider.currentUserId;

    http.Response response = await http.put(Uri.parse("http://localhost:8080/courses/${course.uuid}/users/$userId"));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  ///
  ///
  ///
  static Future<bool> removeUserFromCourse(Course course) async {
    UserProvider userProvider = UserProvider();
    String? userId = userProvider.currentUserId;

    http.Response response = await http.delete(Uri.parse('http://localhost:8080/courses/${course.uuid}/users/$userId'));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  ///
  ///
  ///
  static Future<bool> saveFile(File file) async {
    Uri uri = Uri.parse("http://localhost:8080/files/${file.uuid}");

    var requestBody = {
      "fileBody": file.contents
    };

    var requestHeaders = {
      "Content-Type": "application/json"
    };

    http.Response response = await http.put(uri, headers: requestHeaders, body: jsonEncode(requestBody));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> renameDirectory(Directory directory) async {
    http.Response response = await http.put(Uri.parse("http://localhost:8080/directories/${directory.uuid}"));

    if (response.statusCode ==  200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> renameFile(File file) async {
    http.Response response = await http.put(Uri.parse("http://localhost:8080/files/${file.uuid}"));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> shareFile(File file, User user) async {
    http.Response response = await http.put(Uri.parse("http://localhost:8080/files/${file.uuid}/users/${user.uuid}"));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } 

  static Future<List<Directory>> getDirectoriesForCourse(Course course) async {
    UserProvider userProvider = UserProvider();
    String? userId = userProvider.currentUserId;

    http.Response response = await http.get(Uri.parse("http://localhost:8080/courses/${course.uuid}"));
    if (response.statusCode == 200) {
      List<dynamic> directoriesJson = jsonDecode(response.body)['childFolders'];
      List<Directory> dirsInCourse = directoriesJson.map((json) => Directory.fromJson(json)).toList();
      List<Directory> userDirsInCourse = dirsInCourse.where((dir) => dir.user == userId).toList();
      return userDirsInCourse;
    } else {
      return [];
    }
    
  }
  
  static Future<List<File>> getFilesinDirectory(Directory dir) async {

    http.Response response = await http.get(Uri.parse("http://localhost:8080/directories/${dir.uuid}"));

    if (response.statusCode == 200) {
      List<dynamic> filesJson = jsonDecode(response.body)['files'];
      List<File> filesInDir = filesJson.map((json) => File.fromJson(json)).toList();

      return filesInDir;
    } else {
      return [];
    }
  }

  static Future<List<Directory>> getDirectoriesInDirectory(Directory dir) async {
    http.Response response = await http.get(Uri.parse("http://localhost:8080/directories/${dir.uuid}"));

    if (response.statusCode == 200) {
      List<dynamic> dirsJson = jsonDecode(response.body)['childFolders'];
      List<Directory> dirsInDir = dirsJson.map((json) => Directory.fromJson(json)).toList();

      return dirsInDir;
    } else {
      return [];
    }
  }
  
}