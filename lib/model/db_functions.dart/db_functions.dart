import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:login/model/user_responsr/datum.dart';
import 'package:login/model/user_responsr/support.dart';
import 'package:login/model/user_responsr/user_responsr.dart';

ValueNotifier<List<Datum>> userListNotifier = ValueNotifier([]);
Database? _db;

Future<void> initializeDb() async {
  _db = await openDatabase('users.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE user (id INTEGER  PRIMARY KEY, email TEXT,first_name TEXT,last_name TEXT,avatar TEXT)');
  });
}

Future<void> addUser(List<Datum> value) async {
  value.forEach((element) {
    _db?.rawInsert(
        'INSERT INTO user(email,first_name,last_name,avatar) VALUES (?,?,?,?)',
        [element.email, element.firstName, element.lastName, element.avatar]);
  });
  userListNotifier.value = value;
  print(value.toString());
  userListNotifier.notifyListeners();
}

Future<List<Datum>> getAllUser() async {
  // userListNotifier.value.clear();
  final values = await _db?.rawQuery('SELECT * FROM user') ?? [];
  print("${values.length}");

  userListNotifier.value = values.map((e) => Datum.fromMap(e)).toList();
  userListNotifier.notifyListeners();
  return userListNotifier.value;
}

Future<void> deleteUser(int id) async {
  getAllUser();
}
