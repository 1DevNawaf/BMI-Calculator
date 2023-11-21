import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(@required this.inColor, this.childCard);

  final Color inColor;
  final Widget childCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childCard,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: inColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
