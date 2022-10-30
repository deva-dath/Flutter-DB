import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        height: double.infinity,
        width: double.infinity,
        color: Color.fromARGB(255, 39, 36, 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(20.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 75,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  customOutlineButton("9"),
                  SizedBox(width: 10),
                  customOutlineButton("8"),
                  SizedBox(width: 10),
                  customOutlineButton("7"),
                  SizedBox(width: 10),
                  customOutlineButton("+"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  customOutlineButton("6"),
                  SizedBox(width: 10),
                  customOutlineButton("5"),
                  SizedBox(width: 10),
                  customOutlineButton("4"),
                  SizedBox(width: 10),
                  customOutlineButton("-")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  customOutlineButton("3"),
                  SizedBox(width: 10),
                  customOutlineButton("2"),
                  SizedBox(width: 10),
                  customOutlineButton("1"),
                  SizedBox(width: 10),
                  customOutlineButton("*")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  customOutlineButton("C"),
                  SizedBox(width: 10),
                  customOutlineButton("0"),
                  SizedBox(width: 10),
                  customOutlineButton("="),
                  SizedBox(width: 10),
                  customOutlineButton("/")
                ],
              ),
            ),
            SizedBox(
              height: 130,
            )
          ],
        ),
      ),
    );
  }

  Widget customOutlineButton(String val) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => {btnClicked(val), print(first), print(second)},
        child: Text(
          val,
          style:
              TextStyle(fontSize: 40.0, color: Color.fromARGB(255, 8, 73, 83)),
        ),
      ),
    );
  }

  late int first = 0, second = 0;
  late String opp;
  late String result, text = "";

  void btnClicked(String btntxt) {
    if (btntxt == "C") {
      result = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btntxt == "+" ||
        btntxt == "-" ||
        btntxt == "*" ||
        btntxt == "/") {
      first = int.parse(text);
      result = "";
      opp = btntxt;
    } else if (btntxt == "=") {
      second = int.parse(text);
      if (opp == "+") {
        result = (first + second).toString();
      } else if (opp == "-") {
        result = (first - second).toString();
      } else if (opp == "*") {
        result = (first * second).toString();
      } else if (opp == "/") {
        result = (first / second).toString();
      }
    } else {
      result = int.parse(text + btntxt).toString();
    }
    setState(() {
      text = result;
    });
  }
}
