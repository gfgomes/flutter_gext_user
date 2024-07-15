import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_gext_user/app/data/models/user.dart';

class UserRepository {
  late Database _database;

  Future<void> init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, uuid TEXT, name TEXT, email TEXT, age INTEGER, gender TEXT, country TEXT, city TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<List<User>> getUsers() async {
    final List<Map<String, dynamic>> maps = await _database.query('users');

    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }

  Future<void> addUser(User newUser) async {
    await _database.insert(
      'users',
      newUser.toMap(),
      conflictAlgorithm: ConflictAlgorithm.abort, // Changed to abort
    );
  }

  Future<void> updateUser(User updatedUser) async {
    await _database.update(
      'users',
      updatedUser.toMap(),
      where: 'id = ?',
      whereArgs: [updatedUser.id],
    );
  }

  Future<void> deleteUserByUuid(String userUuid) async {
    await _database.delete(
      'users',
      where: 'uuid = ?',
      whereArgs: [userUuid],
    );
  }

  Future<void> deleteUserById(int userId) async {
    await _database.delete(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
    );
  }
}


