import 'package:fivec_notes/models/course.dart';
import 'package:fivec_notes/models/semester.dart';
import 'package:fivec_notes/models/user.dart';

/// This is the class responsible for the interfaces with other components pertaining to the [Course] objects
///
/// This service class will be interacting with the REST API to retrieve information about the courses
class CourseService {

  /// This function will retrieve the courses that the user is enrolled in for the current semester
  /// 
  /// Using the uuid of the [user], this method will send a request to the API for the courses and return a list of course objects using the [Course.fromJson] constructor
  List<Course> getCurrentCourseList(User user) {
    // Send get request for course list using uuid of provided user and current semester
    // Store returned JSON objects

    // create empty list of courses

    // call json constructor for every course in the array of json objects
    // push the created Course to the list of courses

    // return the list of courses
  }

  /// This function will retrieve the courses that a user in enrolled in for the provided semester
  ///
  /// The list of courses will be requested from the API based on a given [user] and [semester]
  /// To be used for getting courses from past semesters which by default won't be loaded in for speed and memory optimization (lazy loading)
  List<Course> getCourseListForSemester(User user, Semester semester) {
    // Send GET request for course list using uuid of provided user and the provided semester
    // Store returned JSON objects

    // create empty list of courses

    // call json constructor on each of the JSON course objects
    // push the created Course instances to the list of courses

    // return the list of courses
  }

  /// This function will upload the course schedule for a user to the server
  ///
  /// Taking a provided [user] and a [courseSchedule] they will be sent to the server to be processed and added to the database
  bool postCourseSchedule(User user, List<Course> courseSchedule) {
    // convert the list of courses to an array of json objects

    // send a post request to the server for the endpoint matching the id of the provided user and a request body of the JSON objects

    // return true or false based on whether the operation was successful
  }

  /// Send a request to the server to add a [Course] for a [User]
  ///
  /// Given the provided [user] and [course] send a POST request to update the server's user to have the course
  bool postCourse(User user, Course course) {
    // convert course to json
    // using the uuid of the user for the endpoint and the json course as the body send a POST request to the server

    // return true if the request was successful or false if otherwise
  }

  /// This function reads the imported courses from an uploaded ICal file
  ///
  /// This function will read the contents of the file given the provided [icalFileName] and then call [readCoursesFromText] on the contents 
  List<Course> readCoursesFromICal(String icalFileName) {
    // Open file with file name

    // read contents into a string
    // pass string into readCoursesFromText()
    // return the output of that function
  }

  /// This function will read text, parse it for [Course] objects and return a list of [Course]
  ///
  /// Given an [icalText] string which must be formatted in the ical format, the courses will be read and returned in a list
  /// The [Course] objects will be called using the primary [Course] constructor
  List<Course> readCoursesFromText(String icalText) {
    // create empty list of courses

    // break string into array of strings with segments that occur between calendar items in ical format

    // for each element in the array read the values into variables to hold the data
    // call the course constructor using the values of these variables 
    // add the constructed course to the list of courses
  }

  
}