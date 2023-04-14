import "package:flutter/material.dart";

class Result extends StatelessWidget {
  const Result({Key? key, required this.bmi}) : super(key: key);
  final double bmi;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
        ),
        body: Column(
          children: [
            const Text("Your BMI",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Text(bmi.toStringAsFixed(1), style: const TextStyle(fontSize: 25))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {Navigator.of(context).pop()},
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
