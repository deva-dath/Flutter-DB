import 'dart:io';
import 'package:email_validator/email_validator.dart';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/db_functions.dart/db_functions.dart';
import 'model/user_responsr/datum.dart';


class ViewList extends StatefulWidget {
  const ViewList({Key? key}) : super(key: key);

  @override
  State<ViewList> createState() => _ViewListState();
}

class _ViewListState extends State<ViewList> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: userListNotifier,
      builder: (BuildContext context, List<Datum> userList, Widget? child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final dta = userList[index];
            return ListTile(
              title: Text(dta.email ?? ""),
              subtitle: Text(dta.firstName ?? ""),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: userList.length,
        );
      },
    );
  }
}