import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  List<String> laps = ["", ""];

  late Timer globalTimer;
  bool isStopWatchRunning = false;
  int globalStopWatchINMilliSec = 0;

  String _formatTime(int milliseconds) {
    int minutes = milliseconds ~/ 60000;
    int seconds = (milliseconds % 60000) ~/ 1000;
    int milli =
        (milliseconds % 1000) ~/ 10; // Displaying hundredths of a second
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.${milli.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 120),
          child: Column(children: [
            Text(
              _formatTime(globalStopWatchINMilliSec),
              style: TextStyle(
                  fontSize: 85,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        setState(() {
                          globalStopWatchINMilliSec = 0; // Reset the time to zero
                          if (isStopWatchRunning) { // Stop the timer if running
                            globalTimer.cancel();
                            isStopWatchRunning = false;
                          }
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            "Reset",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(120),
                      onTap: () {
                        if (isStopWatchRunning == false) {
                          setState(() {
                            isStopWatchRunning = true;
                          });
                          globalTimer = Timer.periodic(
                              Duration(milliseconds: 1), (callback) {
                            setState(() {
                              globalStopWatchINMilliSec++;
                            });
                          });
                        } else {
                          globalTimer.cancel();
                          setState(() {
                            isStopWatchRunning = false;
                          });
                        }
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.green[800],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            isStopWatchRunning ? "Stop" : "Start",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.green[200],
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
