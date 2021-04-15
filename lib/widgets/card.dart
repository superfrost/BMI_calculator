import 'package:flutter/material.dart';

class TestCard extends StatelessWidget {
  TestCard({
    @required this.color, 
    this.child, 
    this.onTap,
  });
  final Color color;
  final Widget child;
  final Function onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: child,
      ),
    );
  }
}
