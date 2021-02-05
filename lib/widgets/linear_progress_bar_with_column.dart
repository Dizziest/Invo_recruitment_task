import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class linearProgressBarWithColumn extends StatelessWidget {
  const linearProgressBarWithColumn({
    Key key,
    @required this.current,
    @required this.goal,
    @required this.name,
    @required this.image,
    @required this.progressColor,
  }) : super(key: key);

  final String name;
  final String image;
  final double current;
  final double goal;
  final int progressColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image),
        SizedBox(height: 12.0),
        Text(
          name,
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Color(0xff999999)),
        ),
        SizedBox(height: 15.0),
        Text(
          '$current g',
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
          percent: current / goal,
          progressColor: Color(progressColor),
        ),
      ],
    );
  }
}