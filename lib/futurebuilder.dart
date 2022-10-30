import 'dart:convert';
import 'dart:io';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login/model/db_functions.dart/hive_functions.dart';
import 'package:login/model/user_responsr/datum.dart';
import 'package:login/model/user_responsr/user_responsr.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/db_functions.dart/db_functions.dart';

class FutureBuild extends StatefulWidget {
  const FutureBuild({Key? key}) : super(key: key);

  @override
  State<FutureBuild> createState() => _FutureBuildState();
}

class _FutureBuildState extends State<FutureBuild> {
  final url = "https://reqres.in/api/users?page=1";
  List<Datum> users = [];

  Future<List<Datum>?> fetchUsers() async {
    try {
      final response = await get(Uri.parse(url));
      print(response.body);
      // final jsonData = jsonDecode(response.body);

      setState(() {
        users = UserResponsr.fromJson(response.body).data ?? [];
         var userr= Datum(
              email: "devadathcr7007@gmail.com",
              firstName: "Devadath",
              lastName: "CR",
              avatar: "dvchsdgnvcdsc");
        print(users);

        addStudent(users);

        // print(users);
      });
      // return users;
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder:
            (BuildContext context, List<Datum> studentList, Widget? child) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final dta = studentList[index];
              return Card(
                elevation: 10,
                child: ListTile(
                  title: Text(
                    dta.fullName,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    dta.email ?? "",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(dta.avatar ?? ""),
                    minRadius: 30,
                    maxRadius: 40,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(height: 5);
            },
            itemCount: studentList.length,
          );
        },
      )),
    );
  }
}
