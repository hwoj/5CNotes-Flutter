import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
/// This class controls communications with the local sqlite db
///
/// This class is responsible for initializing and facilitating communications to the database
class DatabaseService {
  static Database? _database;

  /// This function returns an initialized database
  ///
  /// If the database is already initialized it just returns it, otherwise it initializes it then returns it
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  /// This function initializes the database
  ///
  /// Called in [database] this function creates the table and initializes the database 
  /// in the case that it wasn't initialized yet
  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), "fileinfo.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE files(
            id INTEGER PRIMARY KEY,
            uuid TEXT,
            name TEXT,
            author TEXT,
            createdAt TEXT,
            lastEdited TEXT,
            course TEXT,
            userCount INTEGER,           
          )
        ''');
        await db.execute(
          '''
            CREATE TABLE semesters(
              id INTEGER PRIMARY KEY,
              uuid TEXT,
              name TEXT,
              isCurrent INTEGER,
            )
          '''
        );
        await db.execute(
          '''
            CREATE TABLE courses(
              id INTEGER PRIMARY KEY,
              uuid TEXT,
              name TEXT,
              code TEXT,
              semester TEXT,
            )
          '''
        );
        await db.execute(
          '''
            CREATE TABLE directory(
              id INTEGER PRIMARY KEY,
              uuid TEXT,
              name TEXT,
              parent TEXT,
              user TEXT,
              course TEXT
            )
          '''
        );
      }
    );
  }
}