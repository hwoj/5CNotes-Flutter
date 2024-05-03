import 'package:fivec_notes/models/course.dart';
import 'package:fivec_notes/models/directory.dart';
import 'package:fivec_notes/models/file.dart';
import 'package:fivec_notes/models/user.dart';
import 'package:fivec_notes/providers/user_provider.dart';
import 'package:fivec_notes/services/api_services/filetree_service.dart';
import 'package:fivec_notes/services/api_services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();

  File file = await FileTreeService.createFile("testfile");
  test('file create test',() {
    expect(file.name, equals("testfile"));
  });

  test('get file using id', () async {
    File testFile = await FileTreeService.getFileById(file.uuid);
    expect(testFile.name, equals(file.name));
  });

  
  test('rename file test', () async {
    file.name = "newname";
    bool isRenamed = await FileTreeService.renameFile(file);
    expect(isRenamed, equals(true));

    File testFile = await FileTreeService.getFileById(file.uuid);
    expect(testFile.name, equals("newname"));
  });

  test('edit file contents test', () async {
    file.contents = "[{\"insert\":\"hello world\",\"attributes\":{\"bold\":true,\"italic\":true,\"underline\":true,\"strike\":true,\"color\":\"#FF283593\"}},{\"insert\":\"\\n\"}]";
    bool isEdited = await FileTreeService.saveFile(file);
    expect(isEdited, equals(true));
    print(file.uuid);
    File testFile = await FileTreeService.getFileById(file.uuid);
    expect(testFile.contents, equals("[{\"insert\":\"hello world\",\"attributes\":{\"bold\":true,\"italic\":true,\"underline\":true,\"strike\":true,\"color\":\"#FF283593\"}},{\"insert\":\"\\n\"}]"));
  });


  Directory directory = await FileTreeService.createDirectory("dirname");
  test("create directory test", () {
    expect(directory.name, equals("dirname"));
  });

  test("get directory using id test", () async {
   
    Directory testDirectory = await FileTreeService.getDirectoryById(directory.uuid);
    expect(testDirectory.name, equals(directory.name));
  });

  test("rename directory test", () async {
    directory.name = "newName";
    bool isRenamed = await FileTreeService.renameDirectory(directory);
    expect(isRenamed, equals(true));

    Directory testDirectory = await FileTreeService.getDirectoryById(directory.uuid);
    expect(testDirectory.name, equals("newName"));
  });

  User user = await UserService.createUser("fName", "lName", "email");
  test("create user test", () {
    expect(user.firstName, equals("fName"));
  });

  test("get user test", () async {
    User testUser = await UserService.getUserByID(user.uuid);
    expect(testUser.firstName, equals("fName"));
  });

  Course course = await FileTreeService.createCourse("CourseName");
  test("create Course test", () {
    expect(course.name, equals("CourseName"));
  });


  test("get course test", () async {
    Course testCourse = await FileTreeService.getCourseById(course.uuid);
    expect(testCourse.name, course.name);
  });

  test("add user to course test", () async {
    bool isAdded = await FileTreeService.addCourseToUser(course);
    expect(isAdded, equals(true));
  });

  test("get classmates test", () async {
    UserProvider userProvider = UserProvider();
    List<User> classmates = await FileTreeService.getClassmates(course);
    expect(classmates[0].uuid, equals(userProvider.currentUserId));
  });


  test('share file with user test', () async {
    bool isShared = await FileTreeService.shareFile(file, user);
    expect(isShared, equals(true));
  });


  


  
  


}