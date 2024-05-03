import 'package:fivec_notes/models/directory.dart';
import 'package:fivec_notes/models/file.dart';

/// The [Course] class encodes the courses that a [User] will be enrolled in
/// 
/// These objects act like the top level directories that contain all the relevant [Directory] and [File] objects
/// They also contain information about the schedules of the courses so that relevant courses can be brought up to the front of the UI
class Course {

  /// The id to refer to the [Course]
  final String uuid;

  /// The display name of the [Course] for the UI
  final String name;

  /// The code for the [Course] used for shorthand purposes in the UI
  final String code;

  /// The semester that the [Course] belongs to. 
  /// The same course will occur in different semesters so this is an easy way of differentiating the objects
  final String semester;

  /// The list of meetings times for the [Course] 
  List<DateTime> meetingTimes = [];

  /// The top level directories within the [Course]
  List<Directory> directories = [];

  /// The top level files within the [Course]
  List<File> files = [];

  /// The primary constructor for the [Course] class
  ///
  /// This constructor will mostly be called by the [Course.fromJson] constructor
  Course({
    required this.uuid,
    required this.name,
    required this.code,
    required this.semester,
    required this.meetingTimes
  });

  /// The JSON constructor for the [Course] class
  /// 
  /// Most of the time courses are going to be read in from the API in JSON and converted into a [Course] using this constructor
  /// The incoming JSON object must have the matching fields
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(uuid: json['folderId'], name: json['folderName'], code: 'code', semester: json['courseSemester'], meetingTimes: []);
  }


}