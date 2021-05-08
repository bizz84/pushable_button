import 'package:flutter/material.dart';
import 'package:pushable_button/pushable_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selection = 'none';

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
    final shadow = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 2),
    );
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PushableButton(
                child: Text('PUSH ME 😎', style: textStyle),
                height: 60,
                elevation: 8,
                hslColor: HSLColor.fromAHSL(1.0, 356, 1.0, 0.43),
                shadow: shadow,
                onPressed: () => setState(() => _selection = '1'),
              ),
              SizedBox(height: 32),
              PushableButton(
                child: Text('ENROLL NOW', style: textStyle),
                height: 60,
                elevation: 8,
                hslColor: HSLColor.fromAHSL(1.0, 120, 1.0, 0.37),
                shadow: shadow,
                onPressed: () => setState(() => _selection = '2'),
              ),
              SizedBox(height: 32),
              PushableButton(
                child: Text('ADD TO BASKET', style: textStyle),
                height: 60,
                elevation: 8,
                hslColor: HSLColor.fromAHSL(1.0, 195, 1.0, 0.43),
                shadow: shadow,
                onPressed: () => setState(() => _selection = '3'),
              ),
              SizedBox(height: 32),
              Text(
                'Pushed: $_selection',
                style: textStyle.copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
