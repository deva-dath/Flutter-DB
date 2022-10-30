import 'dart:convert';

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  factory Support.fromMap(Map<String, dynamic> data) => Support(
        url: data['url'] as String?,
        text: data['text'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'text': text,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Support].
  factory Support.fromJson(String data) {
    return Support.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Support] to a JSON string.
  String toJson() => json.encode(toMap());
}
