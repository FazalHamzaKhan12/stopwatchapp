
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  List<String> laps = ["", ""];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 120),
          child: Column(
            children: [
              Text(
                "00:01:00",
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
                        onTap: () {},
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              "Lap",
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
                        onTap: () {},
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.green[800],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              "Stop",
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align content properly
                  children: [
                    Text(
                      "Lap ${index + 1}",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      "00:00:00",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey[900],
                );
              },
              itemCount: laps.length, // Total items in the list
            ),
          )]
          ),
        ),
      ),
    );
  }
}
