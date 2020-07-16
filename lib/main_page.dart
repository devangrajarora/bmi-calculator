import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_body.dart';
import 'top_card.dart';

enum Gender { male, female }

const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomButtonColour = Color(0xFFE54455);
const bottomButtonHeight = 70.0;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;
  Gender currGender;

  void updateGender(Gender gender) {
    setState(() {
      currGender = gender;
      maleCardColour =
          (gender == Gender.male) ? activeCardColour : inactiveCardColour;
      femaleCardColour =
          (gender == Gender.female) ? activeCardColour : inactiveCardColour;
    });
  }

  Expanded topCards() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () => updateGender(Gender.male),
              child: MyCard(
                colour: maleCardColour,
                content: TopCard(icon: FontAwesomeIcons.mars, text: 'MALE'),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => updateGender(Gender.female),
              child: MyCard(
                colour: femaleCardColour,
                content: TopCard(icon: FontAwesomeIcons.venus, text: 'FEMALE'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded middleCard() {
    return Expanded(
      child: MyCard(
        colour: activeCardColour,
      ),
    );
  }

  Expanded bottomCards() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: MyCard(
              colour: activeCardColour,
            ),
          ),
          Expanded(
            child: MyCard(
              colour: activeCardColour,
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
