import "package:flutter/material.dart";

class Result extends StatelessWidget {
  const Result({Key? key, required this.bmi}) : super(key: key);
  final double bmi;
  @override
  Widget build(BuildContext context) {
    String message = bmi < 18.5
        ? "Underweight"
        : bmi >= 18.5 && bmi <= 24.9
            ? "Normal Weight"
            : bmi >= 25 && bmi <= 29.9
                ? "Overweight"
                : "Obese";
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
          Text(message),
          ElevatedButton(
              onPressed: () => {Navigator.of(context).pop()},
              child: const Text("Recalculate BMI"))
        ]),
      )),
    ));
  }
}
