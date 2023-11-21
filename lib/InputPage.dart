import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_info.dart';
import 'constant.dart';
import 'result_page.dart';
import 'reusable_card.dart';

import 'dart:math';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = kinacitve;
  Color femaleColor = kinacitve;
  double height = 180;
  double weight = 80;
  int age = 18;

  void updateColor(int gen) {
    if (gen == 1) {
      if (maleColor == kinacitve) {
        maleColor = kacitve;
        femaleColor = kinacitve;
      } else {
        maleColor = kinacitve;
      }
    } else {
      if (femaleColor == kinacitve) {
        femaleColor = kacitve;
        maleColor = kinacitve;
      } else
        femaleColor = kinacitve;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //top boxes
          Expanded(
            child: Row(
              children: [
                //first box
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReusableCard(
                      maleColor,
                      CardInfo(
                        'MALE',
                        FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),

                //second box
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(2);
                      });
                    },
                    child: ReusableCard(
                      femaleColor,
                      CardInfo(
                        'FEMALE',
                        FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //middle box
          Expanded(
            child: ReusableCard(
              kinacitve,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toInt().toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFF8D8E98),
                      inactiveTrackColor: Color(0xFFEB1555),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          //bottom boxes
          Expanded(
            child: Row(
              children: [
                //first box
                Expanded(
                  child: ReusableCard(
                    kinacitve,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          weight.toInt().toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              FontAwesomeIcons.minus,
                              () {
                                setState(() {
                                  if (weight > 45) weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                if (weight < 220) weight++;
                              });
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                //second box
                Expanded(
                  child: ReusableCard(
                    kinacitve,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              FontAwesomeIcons.minus,
                              () {
                                setState(() {
                                  if (age > 0) age--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                if (age < 150) age++;
                              });
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //calculate button
          GestureDetector(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 55,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return results(bmiCalc(height, weight));
                }));
              })
        ],
      ),
    );
  }
}

double bmiCalc(double height, double weight) {
  return (weight / pow(height / 100, 2));
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(@required this.icon, @required this.onPressed);
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
