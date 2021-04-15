import 'package:flutter/material.dart';
import 'package:weight_calc/constants.dart';

class IconContainer extends StatelessWidget {
  IconContainer({
    this.icon, 
    this.label, 
    this.color = const Color(0xffffffff),
  });
  final Icon icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: labelFontSize,
            color: color,
          ),
        )
      ],
    );
  }
}
