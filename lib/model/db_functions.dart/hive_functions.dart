import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../user_responsr/datum.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<Datum>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(List<Datum> value) async {
  // studentListNotifier.value.add(value);
  final studentDb = await openHiveBox('users.db');
  await studentDb.addAll(value);
  studentListNotifier.value = value;

  studentListNotifier.notifyListeners();
  // print(value.toString());
}

Future<List<Datum>> getUsers() async {
  final studentDB = await openHiveBox('user_db');
  studentListNotifier.value = studentDB.values.toList();
  studentListNotifier.notifyListeners();
  return studentListNotifier.value;
}

Future<Box<Datum>> openHiveBox(String boxName) async {
  if (!kIsWeb && !Hive.isBoxOpen(boxName)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }

  return await Hive.openBox(boxName);
  //  void allUsers() async {
  //   var response = await getUsers();
  //   print('getUser listr: ${response.length}');
  //   if (response.isEmpty) {
  //     addStudent();
  //   }
  // }
}

void allUsers() async {
  var response = await getUsers();
  if (response.isEmpty) {
    getUsers();
  }
}
