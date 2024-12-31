import 'package:flutter/material.dart';
import 'package:stopwatchapp/StopWatchScreen/stopwatchpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Stop Watch',debugShowCheckedModeBanner: false,home: StopwatchPage(),);
  }
}
