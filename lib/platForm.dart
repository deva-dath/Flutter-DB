import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class ToastMes extends StatefulWidget {
  const ToastMes({Key? key}) : super(key: key);

  @override
  State<ToastMes> createState() => _ToastMesState();
}

class _ToastMesState extends State<ToastMes> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      // final int result = await platform.invokeMethod('getBatteryLevel');
      final int result =
          await platform.invokeMethod('showMessage', {"message": "Task Completed"});
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      print("hai,hello ${e.message}");
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text('Get Battery Level'),
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
