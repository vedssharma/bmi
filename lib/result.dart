import "package:flutter/material.dart";

class Result extends StatefulWidget {
  const Result({Key? key, required this.bmi}) : super(key: key);
  final double bmi;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Add a short delay before starting the animation
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _opacity = 1.0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String message = widget.bmi < 18.5
        ? "Underweight"
        : widget.bmi >= 18.5 && widget.bmi <= 24.9
            ? "Normal Weight"
            : widget.bmi >= 25 && widget.bmi <= 29.9
                ? "Overweight"
                : "Obese";
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Hero(
          tag: "appBarTitle",
          child: Text(
            "BMI Calculator",
            style: TextStyle(fontSize: 20, color: Colors.white), // Ensuring consistent style for Hero
          ),
        ),
      ),
      body: Center(
          child: Container(
        height: 200,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(30),
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 750),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Your BMI",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text(widget.bmi.toStringAsFixed(1),
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold)),
                Text(message),
                const SizedBox(height: 20), // Added some spacing
                ElevatedButton(
                    onPressed: () => {Navigator.of(context).pop()},
                    child: const Text("Recalculate BMI"))
              ]),
        ),
      )),
    ));
  }
}
