import 'package:flutter/material.dart';
import 'InputPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff0A0E21),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xff0A0E21)),
      ),
      home: InputPage(),
    );
  }
}
