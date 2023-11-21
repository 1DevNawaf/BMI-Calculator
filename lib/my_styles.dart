import 'package:flutter/material.dart';

const kBMIText = TextStyle(
  fontSize: 100,
  fontWeight: FontWeight.bold,
);

TextStyle kResultsText(double bmi) {
  Color bmiColor;

  if (bmi > 25)
    bmiColor = Colors.red;
  else if (bmi > 18.5)
    bmiColor = Colors.green;
  else
    bmiColor = Colors.orangeAccent;
  return TextStyle(
    color: bmiColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
}
