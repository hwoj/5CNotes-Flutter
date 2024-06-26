import 'package:fivec_notes/models/file.dart';

/// The [Directory] class represents the different directories that exist within a course for a specific user
/// 
/// Directories are user specific methods of organizing file structure
/// [Directory] objects will mostly be created by reading the local file tree or my consuming REST API endpoints
class Directory {
  
  /// The uuid used to refer to the Directory
  final String uuid;

  /// The directory's name
  String name;

  /// The directory's parent
  String? parent;

  /// The user who owns the directory
  String? user;

  /// The course that the directory sits under
  String? course;

  /// The subdirectories of the directory
  List<Directory> subdirectories = [];

  /// The files inside the directory
  List<File> files = [];

  /// The primary constructor for the [Directory] class
  ///
  /// This constructor will be called when creating [Directory] objects from the file tree or will be called by the [Directory.fromJson] constructor
  /// The constructor requires the [uuid], [name], [parent], [user], and [course] properties to be present
  Directory({
    required this.uuid,
    required this.name,
    this.parent,
    this.user,
    this.course
  });

  /// This is the JSON constructor for [Directory] 
  /// 
  /// This constructor will be used to construct [Directory] objects from the backend's API endpoints
  /// It requires the [json] parameter to have valid structure that map to the class' properties
  factory Directory.fromJson(Map<String, dynamic> json) {
    return Directory(name: json['folderName'], uuid: json['folderId'], user: json['userString']);
  }
}