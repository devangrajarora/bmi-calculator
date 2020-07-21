import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_body.dart';
import 'top_card.dart';
import 'bottom_card.dart';
import 'constants.dart';
import 'calculate_bmi.dart';

enum Gender { male, female }
enum BottomCardType { weight, age }

int heightValue = 150;
int weightValue = 70;
int age = 25;

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

  void updateAge(bool increase) {
    setState(() {
      if (increase) {
        age++;
      } else if (age > 1) {
        age--;
      }
    });
  }

  void updateWeight(bool increase) {
    setState(() {
      if (increase) {
        weightValue++;
      } else if (weightValue > 1) {
        weightValue--;
      }
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
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'HEIGHT',
              style: labelTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  '$heightValue',
                  style: numberStyle,
                ),
                Text(
                  'CM',
                  style: labelTextStyle,
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                overlayShape: RoundSliderOverlayShape(overlayRadius: 22.0),
                overlayColor: Color(0xFFEB1555),
              ),
              child: Slider(
                value: heightValue.toDouble(),
                min: 50.0,
                max: 250.0,
                activeColor: sliderActiveColour,
                // inactiveColor: inactiveCardColour,
                onChanged: (double newVal) {
                  // print('Height:' + newVal.toStringAsFixed(1));
                  setState(() {
                    heightValue = newVal.round();
                  });
                },
              ),
            ),
          ],
        ),
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
              content: BottomCardContent(
                heading: 'WEIGHT',
                number: weightValue.toString(),
                inc: () => updateWeight(true),
                dec: () => updateWeight(false),
              ),
            ),
          ),
          Expanded(
            child: MyCard(
              colour: activeCardColour,
              content: BottomCardContent(
                heading: 'AGE',
                number: age.toString(),
                inc: () => updateAge(true),
                dec: () => updateAge(false),
              ),
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
        onPressed: () {
          BMI result =
              Calculator(height: heightValue, weight: weightValue).getBMI();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsPage(
                verdict: result.verdict,
                bmi: result.bmi,
                message: result.message,
                colour: result.colour,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
