import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wearable_rotary/wearable_rotary.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:wakelock/wakelock.dart';

import 'exercise.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: const TextTheme(
            headline4: TextStyle(fontSize: 80.0),
          )),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color color = Colors.blue;

  late StreamSubscription<RotaryEvent> events;

  @override
  void initState() {
    super.initState();
    // The following line will enable the Android and iOS wakelock.
    Wakelock.enable();

    gyroscopeEvents.listen((GyroscopeEvent event) {
      print(event);
    });

    events = rotaryEvents.listen((RotaryEvent event) {
      if (event == RotaryEvent.clockwise) {
        setState(() => _counter++);
      } else if (event == RotaryEvent.counterClockwise) {
        setState(() => _counter--);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    events.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        color: this.color,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Exercise(),
      ),
    );
  }
}
