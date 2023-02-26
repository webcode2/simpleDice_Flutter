import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int dice1 = 1;
  int dice2 = 1;
  int count = 0;
  void newDice() {
    dice1 = Random().nextInt(6) + 1;
    dice2 = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade500,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            const Text("Dicee"),
            const SizedBox(
              width: 30,
            ),
            Text("$count")
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(55.0),
                  child: Image.asset("assets/images/dice$dice1.png"),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(55.0),
                  child: Image.asset("assets/images/dice$dice2.png"),
                ),
              )
            ]),
            Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextButton(
                    onPressed: () {
                      if (kDebugMode) {
                        setState(() {
                          newDice();
                          count++;
                        });
                      }
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                    child: Text(
                      "Roll",
                      style: TextStyle(
                          color: Colors.red.shade700,
                          fontSize: 40,
                          fontFamily: 'Source Sans Pro'),
                    ),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
