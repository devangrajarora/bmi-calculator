import 'package:flutter/material.dart';

const cardColour = Color(0xFF1D1E33);
const bottomButtonColour = Color(0xFFE54455);
const double cardMargin = 7.0;
const bottomButtonHeight = 70.0;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Expanded topCards() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Card(
              colour: cardColour,
            ),
          ),
          Expanded(
            child: Card(
              colour: cardColour,
            ),
          ),
        ],
      ),
    );
  }

  Container bottonbutton() {
    return Container(
      color: bottomButtonColour,
      width: double.infinity,
      height: bottomButtonHeight,
      margin: EdgeInsets.only(top: 10.0),
      child: FlatButton(
        child: Center(
          child: Text(
            'CALCULATE YOUR BMI',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: () => print('pressed'),
      ),
    );
  }

  Expanded middleCard() {
    return Expanded(
      child: Card(
        colour: cardColour,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              topCards(),
              middleCard(),
              topCards(),
              bottonbutton(),
            ],
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final Color colour;

  Card({@required this.colour});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(cardMargin),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
