import 'dart:math';
import 'package:flutter/material.dart';

class BMIController {
  BMIController({
    @required this.genderIndex, 
    @required this.age, 
    @required this.weight, 
    @required this.height});

  final int weight;
  final int height;
  final int genderIndex;
  final int age;
  double _bmi;

  String calculateBMI() {
    _bmi = (weight + genderIndex*2) / pow((height + age*0.1)/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result() {
    if (_bmi >= 25) return 'Overweight';
    if (_bmi > 18.5) return 'Normal';
    return 'Underweight';
  }

  String interpretation() {
    if (_bmi >= 25) return 'You need some excersize';
    if (_bmi > 18.5) return 'Good job';
    return 'Eat more';
  }
}