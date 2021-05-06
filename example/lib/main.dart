import 'package:flutter/material.dart';
import 'package:pushable_button/pushable_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: PushableButton(
            child: Text(
              'PUSH ME 😎',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            height: 60,
            elevation: 8,
            topColor: HSVColor.fromAHSV(1.0, 356, 1.0, 0.86).toColor(),
            bottomColor: HSVColor.fromAHSV(1.0, 356, 1.0, 0.5).toColor(),
            shadow: BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
            onPressed: () => print('PRESSED'),
          ),
        ),
      ),
    );
  }
}
