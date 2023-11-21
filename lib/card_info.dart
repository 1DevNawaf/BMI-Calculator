import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  CardInfo(this.gender, this.genderIcon);

  String gender;
  IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),
        SizedBox(height: 10),
        Text(
          gender,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
