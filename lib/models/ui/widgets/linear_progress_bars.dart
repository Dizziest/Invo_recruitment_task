import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class fatsProgressBar extends StatelessWidget {
  const fatsProgressBar({
    Key key,
    @required this.fats,
    @required this.fatsGoal,
  }) : super(key: key);

  final double fats;
  final double fatsGoal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/drop.png'),
        SizedBox(height: 12.0),
        Text(
          'Tłuszcze',
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Color(0xff999999)
          ),
        ),
        SizedBox(height: 15.0),
        Text(
          '$fats g',
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 15.0),
        LinearPercentIndicator(
          padding: EdgeInsets.only(left: 5, right: 10),
          width: 90.0,
          lineHeight: 8.0,
          percent: fats/fatsGoal,
          progressColor: Color(0xFFF6BF27),
        ),
      ],
    );
  }
}

class proteinsProgressBar extends StatelessWidget {
  const proteinsProgressBar({
    Key key,
    @required this.proteins,
    @required this.proteinsGoal,
  }) : super(key: key);

  final double proteins;
  final double proteinsGoal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/fish-2.png'),
        SizedBox(height: 15.0),
        Text(
          'Białko',
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Color(0xff999999)
          ),
        ),
        SizedBox(height: 15.0),
        Text(
          '$proteins g',
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 15.0),
        LinearPercentIndicator(
          padding: EdgeInsets.only(left: 5, right: 10),
          width: 90.0,
          lineHeight: 8.0,
          percent: proteins/proteinsGoal,
          progressColor: Color(0xFF609EEE),
        ),
      ],
    );
  }
}

class carbohydratesProgressBar extends StatelessWidget {
  const carbohydratesProgressBar({
    Key key,
    @required this.carbohydrates,
    @required this.carbohydratesGoal,
  }) : super(key: key);

  final double carbohydrates;
  final double carbohydratesGoal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/starch.png'),
        SizedBox(height: 13.0),
        Text(
          'Węglowodany',
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Color(0xff999999)
          ),
        ),
        SizedBox(height: 15.0),
        Text(
          '$carbohydrates g',
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 15.0),
        LinearPercentIndicator(
          padding: EdgeInsets.only(left: 5, right: 10),
          width: 90,
          lineHeight: 8.0,
          percent: carbohydrates/carbohydratesGoal,
          progressColor: Color(0xFF48B2A1),
        ),
      ],

    );
  }
}
