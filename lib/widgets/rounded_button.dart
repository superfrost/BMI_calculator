import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    this.onPressed, 
    this.icon, 
    this.radius = 25.0, 
    this.color = const Color(0x30ffffff),
  });
  final Function onPressed;
  final Icon icon;
  final double radius;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      onPressed: onPressed,
      constraints: BoxConstraints(minWidth: radius*2, minHeight: radius*2),
      fillColor: color,
      child: icon,
    );
  }
}