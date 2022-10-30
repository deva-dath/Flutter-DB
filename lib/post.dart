import 'dart:io';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostApi extends StatefulWidget {
  const PostApi({Key? key}) : super(key: key);

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {
  final url = "https://jsonplaceholder.typicode.com/posts";

  void postData() async {
    try {
      final response = await post(Uri.parse(url), body: {
        "title": "George",
        "body":
            "HTTPS GET and POST Requests in Flutter | Fetch Data from the Internet",
        "userId": "102"
      });
      print(response.body);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ElevatedButton(onPressed: postData, child: Text("Send post")),
        ),
      ),
    );
  }
}
