// import 'dart:html';
import 'dart:io';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TxtField extends StatefulWidget {
  TxtField({Key? key}) : super(key: key);

  @override
  State<TxtField> createState() => _TxtFieldState();
}

class _TxtFieldState extends State<TxtField> {
  final _textController = TextEditingController();
  String displayText = 'Enter something here';
  int _initialValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 2"),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          color: Color.fromARGB(255, 218, 255, 145),
          child: Column(
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(30),
                    border: OutlineInputBorder(),
                    hintText: 'Enter the detail'),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(_textController);
                    setState(() {
                      _initialValue++;
                      if (displayText == "") {
                        _initialValue = 0;
                      }
                      displayText = _textController.text;
                    });
                  },
                  child: Text('Click here')),
              Text('Current value is $_initialValue'),
              Text(displayText)
            ],
          ),
        ),
      )),
    );
  }
}
