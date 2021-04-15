import 'package:flutter/material.dart';
import 'package:weight_calc/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    @required this.onTap,
    @required this.label,
  });
  final String label;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 4),
        height: bottomButtonHeight,
        width: double.infinity,
        color: bottomButtonColor,
        child: Center(
            child: Text(
          label,
          style: bottomButtonTextStyle,
        )),
      ),
    );
  }
}