/// The User class that will represent all different types of user using the application
/// 
/// The User objects will be created after a successful signup is registered with the backend.
/// They will typically be constructed taking in the JSON objects from the backend.
/// An example would be retrieving all the users that share a course with the user so they can share files with them

class User {
  /// The backend generated UUID for the user
  final String uuid;

  /// The 5C email the user signed up with
  final String email;

  /// User's first name
  final String firstName;

  /// User's last name
  final String lastName;

  /// Constructs a new [User] instance from the provided [uuid], [email], [firstName] and [lastName]
  /// 
  /// This is the primary constructor that will exist for the [User] class and can be called by other constructors like [User.fromJson]
  User({
    required this.uuid,
    required this.email,
    required this.firstName,
    required this.lastName
  });

  /// Constructs a [User] instance from a JSON object
  /// 
  /// The [json] argument must contain the 'uuid', 'email', 'firstName' and 'lastName' properties
  factory User.fromJson(Map<String, dynamic> json) {
    return User(uuid: json['uuid'], email: json['email'], firstName: json['firstName'], lastName: json['lastName']);
  }

}