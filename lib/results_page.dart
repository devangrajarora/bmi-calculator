import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

final TextStyle bmiStyle = TextStyle(
  fontSize: 90.0,
  fontWeight: FontWeight.w900,
);

class ResultsPage extends StatelessWidget {
  final String verdict;
  final double bmi;
  final String message;
  final Color colour;

  ResultsPage({this.verdict, this.bmi, this.message, this.colour});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Container(
        color: activeCardColour,
        // margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              verdict,
              style: TextStyle(
                color: colour,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              bmi.toString(),
              style: bmiStyle,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Normal BMI range:',
              style: TextStyle(fontSize: 25.0, color: Color(0xFF5D5F6D)),
            ),
            Text(
              '18.5 - 25 kg/m\u00B2',
              style: TextStyle(fontSize: 25.0, color: Color(0xFFF1F1F2)),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              message,
              style: TextStyle(fontSize: 25.0, color: Color(0xFFF1F1F2)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 70.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 60.0,
                width: 150.0,
                color: Color(0xFF090C22),
                child: Center(
                  child: Text(
                    'GO BACK',
                    style: TextStyle(fontSize: 20.0, color: Color(0xFFF1F1F2)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
