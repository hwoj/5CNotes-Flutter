import 'package:fivec_notes/models/course.dart';
import 'package:fivec_notes/models/user.dart';

/// This is the class responsible for the interfaces with other components pertaining to the [User] objects
///
/// This service class will be interacting with the REST API to retrieve information about the users
class UserService {

  /// Retrieves the information for a [User] from the provided [uuid]
  ///
  /// A GET request will be sent to the Spring server to retrieve the information about the user, returning it as a [User]
  /// The [User] object is generated using the [User.fromJson] constructor
  User getUserFromID(String uuid) {
    // send GET request to server to retrieve user with uuid
    // store json object returned by request

    // call the json constructor for the user
    // return the created user
  }

  /// Retrieves the classmates a [User] has for a given [Course]
  ///
  /// Using the uuid of the [user] and the uuid of the [course] a GET request to the server will retrieve the classmates
  /// The [User.fromJson] constructor will be called on each of the returned users and returned in a list
  List<User> getClassmates(User user, Course course) {
    // send GET request to retrieve the classmates using the uuids of the user and course
    // store the returned json objects

    // create empty list of users

    // for each object call the user json constructor and pass the user into the list
    // return the list of users
  }


}