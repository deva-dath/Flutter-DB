// import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login/model/db_functions.dart/db_functions.dart';
import 'package:login/platForm.dart';
import 'package:login/post.dart';
import 'package:login/register.dart';
import 'package:login/stateless.dart';
import 'package:login/lists.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:login/model/user_responsr/datum.dart';
import 'package:login/model/user_responsr/support.dart';
import 'package:login/model/user_responsr/user_responsr.dart';

import 'calc.dart';
import 'futurebuilder.dart';
import 'get.dart';
import 'login.dart';
import 'model/db_functions.dart/hive_functions.dart';

Future main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // initializeDb();
  // getAllUser();

  // addStudent();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(DatumAdapter().typeId)) {
    Hive.registerAdapter(DatumAdapter());
  }
  // allUsers();
  // getUsers();
  // addStudent();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromARGB(31, 37, 36, 36)),
      home: FutureBuild(),
      routes: {"PrimeRoute": (context) => FutureBuild()},
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HomeScreen',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert),
            onPressed: () {},
          ),
          IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogIn()));
              })
        ],
      ),
      body: FutureBuild(),
    );
  }
}
