import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'datum.g.dart';
@HiveType(typeId: 1)
class Datum  extends HiveObject {
  // @JsonKey(name: "id")
  @HiveField(0)
  int? id;
  // @JsonKey(name: "email")
  @HiveField(1)
  String? email;
  // @JsonKey(name: "firstName")
  @HiveField(2)
  String? firstName;
  // @JsonKey(name: "lastName")
  @HiveField(3)
  String? lastName;
  // @JsonKey(name: "avatar")
  @HiveField(4)
  String? avatar;

  Datum({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['id'] as int?,
        email: data['email'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        avatar: data['avatar'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'avatar': avatar,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  String get fullName => '$firstName $lastName';
}
