import 'package:flutter/material.dart';
import 'constants.dart';

class BottomCardContent extends StatelessWidget {
  final String heading;
  final String number;
  final Function dec;
  final Function inc;

  BottomCardContent({this.heading, this.number, this.dec, this.inc});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          heading,
          style: labelTextStyle,
        ),
        Text(
          number,
          style: numberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundIconButton(icon: Icons.remove, action: dec),
            RoundIconButton(icon: Icons.add, action: inc),
          ],
        )
      ],
    );
  }
}

final BoxConstraints iconButtonSizeConstraints = BoxConstraints.tightFor(
  width: 50.0,
  height: 50.0,
);

// custom widget
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function action;
  RoundIconButton({@required this.icon, @required this.action});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: action,
      fillColor: bottomCardButtonColour,
      shape: CircleBorder(),
      constraints: iconButtonSizeConstraints,
      elevation: 6.0,
    );
  }
}
