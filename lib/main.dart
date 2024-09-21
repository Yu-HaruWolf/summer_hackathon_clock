import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:summer_hackathon_clock/youtube.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDSC Japan Summer Hackathon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  final TextStyle clockStyle = TextStyle(
      color: Colors.grey.shade700,
      decoration: TextDecoration.none,
      fontSize: 106,
      fontFamily: 'GoogleSans');
  final DateFormat dateFormat = DateFormat("HH:mm:ss");

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DateTime _time;
  late Timer _timer;
  bool playerVisible = false;

  @override
  void initState() {
    super.initState();
    _time = DateTime.now();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _time = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: const FractionalOffset(0.2, 0.85),
              children: [
                Image.asset('assets/images/hackathonimg1-2.jpg'),
                FittedBox(
                  child: Text(widget.dateFormat.format(_time),
                      style: widget.clockStyle),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    playerVisible = !playerVisible;
                  });
                },
                child: Text('YouTube')),
            Visibility(visible: playerVisible, child: YouTubePlayerWidget())
          ],
        ),
      ),
    );
  }
}
