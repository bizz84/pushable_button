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
          padding: const EdgeInsets.all(8.0),
          child: PushableButton(
            child: Text('PUSH ME 😎',
                style: TextStyle(color: Colors.white, fontSize: 24)),
            height: 60,
            elevation: 8,
            topColor: Colors.indigo[400],
            bottomColor: Colors.indigo[600],
            onPressed: () => print('PRESSED'),
          ),
        ),
      ),
    );
  }
}
