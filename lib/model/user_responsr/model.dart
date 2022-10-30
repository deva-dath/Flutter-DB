import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

class Datum {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  Datum(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar
    };
  }
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
