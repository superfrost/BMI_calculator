import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weight_calc/constants.dart';
import 'package:weight_calc/widgets/rounded_button.dart';

class ColumnNumButtons extends StatelessWidget {
  ColumnNumButtons({this.label, this.bigNum, this.onPressedSub, this.onPressedAdd});  
  final String label;
  final int bigNum;
  final Function onPressedSub;
  final Function onPressedAdd;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: labelFontSize),
        ),
        Text(bigNum.toString(), style: bigLabelStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
              onPressed: onPressedSub,
              icon: Icon(FontAwesomeIcons.minus),
            ),
            SizedBox(width: 10),
            RoundedButton(
              onPressed: onPressedAdd,
              icon: Icon(FontAwesomeIcons.plus),
            ),
          ],
        ),
      ],
    );
  }
}
