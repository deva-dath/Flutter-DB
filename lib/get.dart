import 'dart:convert';
import 'dart:io';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class GetApi extends StatefulWidget {
  const GetApi({Key? key}) : super(key: key);

  @override
  State<GetApi> createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  final url = "https://jsonplaceholder.typicode.com/posts";
  var postsJson = [];

  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      print(response.body);
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        postsJson = jsonData;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: ListView.builder(
              itemCount: postsJson.length,
              itemBuilder: (context, i) {
                final posts = postsJson[i];
                return RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Title: ${posts["title"]}\n",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'RobotoMono')),
                    TextSpan(
                        text: "Body:${posts["body"]}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Schyler'))
                  ]),
                );
              }),
        ),
      ),
    );
  }
}
