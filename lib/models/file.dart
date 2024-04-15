import 'package:fivec_notes/models/user.dart';

/// The class that encapsulates the metadata and file contents
/// 
/// The [File] class will handle the operations that are performed on files both pertaining to metadata and file contents. 
/// The class will frequently make calls to the [FileService] to handle interfaces with other components of the project

class File {
  /// The UUID of the file
  final String uuid;

  /// The string name of the file
  String name;

  /// The list of the collaborators that have access to the file
  List<User>? collaborators = [];

  /// The uuid of the author of the file
  final String author;

  /// The UTC server time timestamp for when the file was created
  final DateTime createdAt;

  /// The UTC server time timestamp for the last database persistent edit of the file
  DateTime? lastEdited;

  /// The UUID for the course that the file belongs to
  final String course;

  /// The number of [User] that have access to a given file
  int? userCount;

  /// Constructs a new [File] instance from the provided [uuid], [name], [author], [createdAt] datetime, [lastEdited] datetime, [course] and optionally the [collaborators] and [userCount] 
  /// 
  /// This constructor is less likely to be called from places other than the [File.fromJson] constructor
  File({
    required this.uuid,
    required this.name,
    required this.author,
    required this.createdAt,
    required this.lastEdited,
    required this.course,
    this.collaborators,
    this.userCount,

  });

  /// This constructor will create a File given a properly formated JSON input
  /// 
  /// This is the constructor that will be called the most when interacting with data from the server
  factory File.fromJson(Map<String, dynamic> json) {
    return File(uuid: json['uuid'], 
      name: json['name'], 
      author: json['author'], 
      createdAt: json['createdAt'], 
      lastEdited: json['lastEdited'], 
      course: json['course'],
      collaborators: json['collaborators'],
      userCount: json['userCount']
      );

  }



}