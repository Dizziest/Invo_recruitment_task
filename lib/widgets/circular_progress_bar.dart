import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class circularCaloriesBar extends StatelessWidget {
  const circularCaloriesBar({
    Key key,
    @required this.caloriesDone,
    @required this.caloriesGoal,
  }) : super(key: key);

  final int caloriesDone;
  final int caloriesGoal;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 200.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 8.0,
      percent: caloriesDone / caloriesGoal,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/calories@2x.png'),
          SizedBox(height: 5.0),
          Text(
            "$caloriesDone kcal",
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w700,
              fontSize: 19.0,
            ),
          ),
          SizedBox(height: 3.0),
          Text(
            "/$caloriesGoal kcal",
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: Color(0xff999999)
            ),
          ),
        ],
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.deepOrange,
    );
  }
}