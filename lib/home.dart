import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "./result.dart";

const List<String> heightUnits = ["cm", "in"];
const List<String> weightUnits = ["kg", "lb"];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  String heightUnit = heightUnits.first;
  String weightUnit = weightUnits.first;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  calculateBmi() {
    if (heightUnit == "in" && weightUnit == "lb") {
      return (double.parse(weightController.text) /
              (double.parse(heightController.text) *
                  double.parse(heightController.text))) *
          703;
    } else {
      double heightMeters = double.parse(heightController.text) / 100.0;
      return double.parse(weightController.text) /
          (heightMeters * heightMeters);
    }
  }

  handleWeightUnitChange(unit) {
    setState(
      () => {
        weightUnit = unit,
        if (unit == "kg") {heightUnit = "cm"} else {heightUnit = "in"}
      },
    );
  }

  handleHeightUnitChange(unit) {
    setState(() => {
          heightUnit = unit,
          if (unit == "cm") {weightUnit = "kg"} else {weightUnit = "lb"}
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(40),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(labelText: "Height"),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: heightController,
                    ),
                  ),
                  DropdownButton(
                      value: heightUnit,
                      items: heightUnits
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (input) => {handleHeightUnitChange(input)},
                      icon: const Icon(Icons.arrow_downward)),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(labelText: "Weight"),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: weightController,
                    ),
                  ),
                  DropdownButton(
                      value: weightUnit,
                      items: weightUnits
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (input) => {handleWeightUnitChange(input)},
                      icon: const Icon(Icons.arrow_downward))
                ],
              ),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Result(bmi: calculateBmi())))
                      },
                  child: const Text("Calculate my BMI"))
            ],
          )),
    );
  }
}
