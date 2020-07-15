import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_body.dart';
import 'top_card.dart';

const cardColour = Color(0xFF1D1E33);
const bottomButtonColour = Color(0xFFE54455);
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
            child: MyCard(
              colour: cardColour,
              content: TopCard(icon: FontAwesomeIcons.mars, text: 'MALE'),
            ),
          ),
          Expanded(
            child: MyCard(
              colour: cardColour,
              content: TopCard(icon: FontAwesomeIcons.venus, text: 'FEMALE'),
            ),
          ),
        ],
      ),
    );
  }

  Expanded middleCard() {
    return Expanded(
      child: MyCard(
        colour: cardColour,
      ),
    );
  }

  Expanded bottomCards() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: MyCard(
              colour: cardColour,
            ),
          ),
          Expanded(
            child: MyCard(
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
              bottomCards(),
              bottonbutton(),
            ],
          ),
        ),
      ),
    );
  }
}
