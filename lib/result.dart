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
      body: Center(
          child: Container(
        height: 200,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Text("Your BMI",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          Text(bmi.toStringAsFixed(1),
              style:
                  const TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          const Text("You are normal"),
          ElevatedButton(
              onPressed: () => {Navigator.of(context).pop()},
              child: const Text("Recalculate BMI"))
        ]),
      )),
    ));
  }
}
