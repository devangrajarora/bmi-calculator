import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BMI {
  String verdict;
  double bmi;
  String message;
  Color colour;

  BMI({this.verdict, this.bmi, this.message, this.colour});
}

class Calculator {
  int weight;
  int height;

  Calculator({this.weight, this.height});

  BMI getBMI() {
    String verdict, message;
    Color colour;

    double bmi =
        num.parse((weight / pow(height / 100.0, 2)).toStringAsFixed(2));
    if (bmi < 18.5) {
      verdict = 'UNDERWEIGHT';
      message = 'Your BMI result is quite low, you should focus on your diet.';
      colour = Colors.amber[700];
    } else if (bmi >= 18.5 && bmi <= 25) {
      verdict = 'NORMAL';
      message = 'You have a normal body weight. Good Job!';
      colour = Color(0xFF7DDA7A);
    } else if (bmi > 25 && bmi <= 30) {
      verdict = 'OVERWEIGHT';
      message =
          'You are just above the healthy weight range. Try to exercise regularly !';
      colour = Colors.deepOrange[600];
    } else {
      verdict = 'OBESE';
      message =
          'You are above the healthy weight range. Try to exercise regularly and focus on your diet !';
      colour = Colors.redAccent[700];
    }

    return BMI(bmi: bmi, verdict: verdict, message: message, colour: colour);
  }
}
