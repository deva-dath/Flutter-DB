import 'dart:convert';

import 'datum.dart';
import 'support.dart';

class UserResponsr {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Datum>? data;
  Support? support;

  UserResponsr({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory UserResponsr.fromMap(Map<String, dynamic> data) => UserResponsr(
        page: data['page'] as int?,
        perPage: data['per_page'] as int?,
        total: data['total'] as int?,
        totalPages: data['total_pages'] as int?,
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
            .toList(),
        support: data['support'] == null
            ? null
            : Support.fromMap(data['support'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'page': page,
        'per_page': perPage,
        'total': total,
        'total_pages': totalPages,
        'data': data?.map((e) => e.toMap()).toList(),
        'support': support?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserResponsr].
  factory UserResponsr.fromJson(String data) {
    return UserResponsr.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserResponsr] to a JSON string.
  String toJson() => json.encode(toMap());
}
