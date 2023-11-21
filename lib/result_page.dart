import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'my_styles.dart';

class results extends StatelessWidget {
  double bmi;
  results(double bmi) {
    this.bmi = bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //"Results" text
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Results',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),

          //results card
          Expanded(
            flex: 6,
            child: ReusableCard(
              kacitve,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //weight status
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      statText(bmi),
                      style: kResultsText(bmi),
                    ),
                  ),

                  //weight Number
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      bmi.toInt().toString(),
                      style: kNumberStyle,
                    ),
                  ),

                  //advice
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      adviceText(bmi),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),

          //re-calc button
          GestureDetector(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 55,
              ),
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }

  String adviceText(double bmi) {
    if (bmi > 25)
      return 'Your Body Mass Index is ' +
          bmi.toInt().toString() +
          ' This is considered obese, do some workouts';
    else if (bmi > 18.5)
      return 'Your Body Mass Index is ' +
          bmi.toInt().toString() +
          ' This is considered normal, keep going';
    else
      return 'Your Body Mass Index is ' +
          bmi.toInt().toString() +
          ' This is considered n7ef, do some workouts and eat';
  }

  String statText(double bmi) {
    if (bmi > 25)
      return 'Overweight';
    else if (bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }
}
